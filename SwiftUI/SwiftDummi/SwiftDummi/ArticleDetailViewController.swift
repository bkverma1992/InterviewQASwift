
import UIKit

class ArticleDetailViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var titleLabel: UILabel!

    var article: Article?
    override func viewDidLoad() {
        super.viewDidLoad()
        textView.text = article?.description
        titleLabel.text = article?.title
        
        if let article = article {
            DispatchQueue.global().async {
                if let data = try? Data(contentsOf: article.url)  {
                    DispatchQueue.main.async {
                        self.imageView.image = UIImage(data: data)
                    }
                }
            }
        }
    }

}
