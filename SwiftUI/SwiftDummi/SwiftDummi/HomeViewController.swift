
import UIKit
import Foundation
import Network

class HomeViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    var articleArray = [Article]()
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loadArticles()
        tableView.register(UINib(nibName: "ListTVC", bundle: nil), forCellReuseIdentifier: "ListTVC")
    }
    
    
    func loadArticles() {
        let api = Network()
        DispatchQueue.global().async {
            api.loadRequest { result in
                switch result {
                case .success(let data):
                    self.parseData(data: data)
                case .failure(let error):
                    print(error)
                }
            }
            
        }
    }
        
    func parseData(data: Data) {
        do {
            let jsonObject = try JSONSerialization.jsonObject(with: data, options: [])
            if let jsonDict = jsonObject as? [String: Any],
               let photoArray = jsonDict["photos"] as? [[String: Any]] {

                for item in photoArray {
                    let id = String(item["id"] as? Int ?? 0)
                    let title = item["title"] as? String ?? ""
                    let description = item["description"] as? String ?? ""
                    let urlString = item["url"] as? String ?? ""
                    let url = URL(string: urlString) ?? URL(string: "https://dummy.com")!

                    let article = Article(title: title, description: description, id: id, url: url)
                    articleArray.append(article)
                }

                print(articleArray)
                DispatchQueue.main.async {
                    self.tableView.delegate = self
                    self.tableView.dataSource = self
                    self.tableView.reloadData()
                }

            } else {
                print("Error: JSON format not as expected")
            }
        } catch {
            print("JSON parse error:", error)
        }
    }
    
    func stripTags(str: String) -> String {
        var result = str.replacingOccurrences(of: "</p> <p>", with: "\n\n") as NSString
        var range = result.range(of: "<[^>]+>", options: .regularExpression)
        while range.location != NSNotFound {
            result = result.replacingCharacters(in: range, with: "") as NSString
            range = result.range(of: "<[^>]+>", options: .regularExpression)
        }
        return result as String
    }
    
    func getURL(str: String?) -> URL? {
        guard let str = str,
                let detector = try? NSDataDetector(types: NSTextCheckingResult.CheckingType.link.rawValue) else { return nil }
        let matches = detector.matches(in: str, options: [], range: NSRange(location: 0, length: (str as NSString).length))
        if let url = matches.first?.url {
            return url
        }
        
        return nil
    }
}

extension HomeViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        articleArray.count
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "ListTVC") as! ListTVC
        
        let article = articleArray[indexPath.row]
        cell.titleLbl.text = article.title
        cell.descLbl.text = article.id
        
        DispatchQueue.global().async {
            if let data = try? Data(contentsOf: article.url)  {
                DispatchQueue.main.async {
                    cell.imgView.image = UIImage(data: data)
                }
            }
        }
        
        return cell
    }
}

extension HomeViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = ArticleDetailViewController(nibName: "ArticleDetailViewController", bundle: nil)
        vc.article = articleArray[indexPath.row]
        self.navigationController?.pushViewController(vc, animated: true)
    }
}

