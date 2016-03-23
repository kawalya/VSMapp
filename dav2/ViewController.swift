import UIKit

class ViewController: UIViewController {
    
    var xposition : CGFloat = 10.0
    var yposition : CGFloat = 10.0
    var stickerDictionary = [String: UIView]()
    let buttonOrangeColor:UIButton! = UIButton(type: .System)
    let buttonGreenColor:UIButton! = UIButton(type: .System)
    let buttonRedColor:UIButton! = UIButton(type: .System)
    let buttonDelete:UIButton! = UIButton(type: .System)
    let screenSize = UIScreen.mainScreen().bounds
    let scrollView = UIScrollView(frame: CGRectMake(0, 194, UIScreen.mainScreen().bounds.width, 500))
    var StickerArray = [UIView]()
    var StickerArray1 = [UIView]()
    
    let scrollImage = UIScrollView()
    let scrollView1 = UIScrollView(frame: CGRectMake(0, 700, UIScreen.mainScreen().bounds.width, 300))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        makeButtonCreateSticker()
        var count = CGFloat(stickerDictionary.count+100)
        count += 10000
        //scrollView.backgroundColor = UIColor.redColor()
        //scrollView.contentSize = view.bounds.size
        scrollView.scrollEnabled = true
        scrollView.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        scrollView.autoresizingMask =  UIViewAutoresizing.FlexibleHeight
        self.scrollView.contentInset = UIEdgeInsetsMake(0, 100, 0, count)
        scrollView.contentSize = CGSizeMake(scrollView.contentSize.width,1)
        scrollView.contentSize = CGSize(width: 100, height: 100)
        
        scrollView1.scrollEnabled = true
        scrollView1.autoresizingMask = UIViewAutoresizing.FlexibleWidth
        scrollView1.autoresizingMask =  UIViewAutoresizing.FlexibleHeight
        self.scrollView1.contentInset = UIEdgeInsetsMake(0, 100, 0, count)
        scrollView1.contentSize = CGSizeMake(scrollView.contentSize.width,1)
        scrollView1.contentSize = CGSize(width: 100, height: 100)
        
        
        scrollView1.backgroundColor = UIColor.yellowColor()
        scrollView.backgroundColor = UIColor.redColor()
        view.addSubview(scrollView)
        view.addSubview(scrollView1)
        
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        
    }
    
    
    
    
    func makeButtonCreateSticker(){
        let buttonCreateSticker:UIButton! = UIButton(type: .System)
        buttonCreateSticker.frame = CGRectMake(20, 30, 110, 30)
        buttonCreateSticker.layer.cornerRadius = 5
        buttonCreateSticker.backgroundColor = UIColor.greenColor()
        buttonCreateSticker.setTitle("Create Sticker", forState: UIControlState.Normal)
        buttonCreateSticker.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonCreateSticker.addTarget(self, action: #selector(ViewController.buttonCreateStickerPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        self.view.addSubview(buttonCreateSticker)
    }
    
    
    func buttonCreateStickerPressed(sender: UIButton!){
        let stickerName = "Sticker Number "+String(stickerDictionary.count+1)
        let stickerNumber = stickerDictionary.count+1
        makeSticker(stickerName, stickerNumber: stickerNumber)
    }
    
    func buttonOrangeColorPressed(sender: UIButton!){
        let sentView = sender.superview
        sentView?.tintColor = UIColor.orangeColor()
    }
    
    
    func buttonGreenColorPressed(sender: UIButton!){
        let sentView = sender.superview
        sentView?.tintColor = UIColor.greenColor()
    }
    
    
    func buttonRedColorPressed(sender: UIButton!){
        let sentView = sender.superview
        sentView?.tintColor = UIColor.redColor()
        
    }
    
    func buttonDeletePressed(sender: UIButton!){
        let sentView = sender.superview
        let tag = sentView?.tag
        let stickerName = "Sticker Number "+String(tag)
        stickerDictionary.removeValueForKey(stickerName)
        sentView?.hidden = true
    }
    
    
    func makeSticker(stickerLabel: String, stickerNumber: Int){
        
        let imageView = UIImageView(image: UIImage(named: "postit1")!)
        imageView.image = imageView.image!.imageWithRenderingMode(UIImageRenderingMode.AlwaysTemplate)
        
        imageView.contentMode = UIViewContentMode.ScaleAspectFill
        imageView.tintColor = UIColor.greenColor()
        
        
        yposition += 40.0
        
        imageView.frame = CGRectMake(0, 0, 200, 100 )
        xposition += 500.0
        view.tag = stickerNumber
        imageView.layer.cornerRadius = 6
        imageView.tag = stickerNumber
        view.addSubview(imageView)
        
        let layer = imageView.layer
        layer.shadowColor = UIColor.blackColor().CGColor
        layer.shadowOffset = CGSize(width: 0, height: -3)
        layer.shadowOpacity = 0.4
        layer.shadowRadius = 5
        
        
        let gesture = UIPanGestureRecognizer(target: self, action: #selector(ViewController.dragged(_:)))
        imageView.addGestureRecognizer(gesture)
        view.userInteractionEnabled = true
        imageView.userInteractionEnabled = true
        
        
        let tap = UITapGestureRecognizer(target: self, action: (#selector(ViewController.doubleTapped(_:))))
        tap.numberOfTapsRequired = 2
        imageView.addGestureRecognizer(tap)
        
        let tapone = UITapGestureRecognizer(target: self, action: (#selector(ViewController.singleTapped(_:))))
        tapone.numberOfTapsRequired = 1
        imageView.addGestureRecognizer(tapone)
        
        
        
        
        let textLabel = UITextField(frame: CGRectMake(2.0, 1.0, 200.0, 8.0))
        textLabel.textAlignment = NSTextAlignment.Center
        textLabel.font = UIFont.italicSystemFontOfSize(8)
        textLabel.textColor = UIColor.blackColor()
        textLabel.text = stickerLabel
        
        
        
        let SerialNumber = UITextView(frame: CGRectMake(90, 20, 80, 30))
        SerialNumber.alpha = 0.4
        let Serial = UILabel(frame: CGRectMake(30, 20, 50, 50))
        Serial.text = "Serial Number"
        Serial.font = Serial.font.fontWithSize(7)
        SerialNumber.textAlignment = NSTextAlignment.Center
        SerialNumber.font = UIFont.italicSystemFontOfSize(8)
        SerialNumber.textColor = UIColor.blackColor()
        imageView.addSubview(SerialNumber)
        imageView.addSubview(Serial)
        
        
        
        let taskTitle = UITextView(frame: CGRectMake(90, 60, 80, 30))
        taskTitle.alpha = 0.4
        let task = UILabel(frame: CGRectMake(30, 50, 50, 50))
        task.text = "Task Title"
        task.font = Serial.font.fontWithSize(7)
        taskTitle.textAlignment = NSTextAlignment.Center
        taskTitle.font = UIFont.italicSystemFontOfSize(8)
        taskTitle.textColor = UIColor.blackColor()
        imageView.addSubview(taskTitle)
        imageView.addSubview(task)
        
        
        let duration = UITextView(frame: CGRectMake(90, 100, 80, 30))
        duration.alpha = 0.4
        let dur = UILabel(frame: CGRectMake(30, 90, 50, 50))
        dur.text = "Duration"
        dur.font = Serial.font.fontWithSize(7)
        duration.textAlignment = NSTextAlignment.Center
        duration.font = UIFont.italicSystemFontOfSize(8)
        duration.textColor = UIColor.blackColor()
        imageView.addSubview(duration)
        imageView.addSubview(dur)
        
        
        let productQuantity = UITextView(frame: CGRectMake(90, 140, 80, 30))
        productQuantity.alpha = 0.4
        let product = UILabel(frame: CGRectMake(30, 130, 50, 50))
        product.text = "Product Quantity"
        product.font = Serial.font.fontWithSize(7)
        productQuantity.textAlignment = NSTextAlignment.Center
        productQuantity.font = UIFont.italicSystemFontOfSize(8)
        productQuantity.textColor = UIColor.blackColor()
        imageView.addSubview(productQuantity)
        imageView.addSubview(product)
        
        
        
        let distance = UITextView(frame: CGRectMake(90, 180, 80, 30))
        distance.alpha = 0.4
        let dis = UILabel(frame: CGRectMake(30, 170, 50, 50))
        dis.text = "Distance"
        dis.font = Serial.font.fontWithSize(7)
        distance.textAlignment = NSTextAlignment.Center
        distance.font = UIFont.italicSystemFontOfSize(8)
        distance.textColor = UIColor.blackColor()
        imageView.addSubview(distance)
        imageView.addSubview(dis)
        
        
        let SystemConnection = UITextView(frame: CGRectMake(90, 220, 80, 30))
        SystemConnection.alpha = 0.4
        let system = UILabel(frame: CGRectMake(30, 200, 50, 60))
        system.text = "System Connection"
        system.font = Serial.font.fontWithSize(7)
        SystemConnection.textAlignment = NSTextAlignment.Center
        SystemConnection.font = UIFont.italicSystemFontOfSize(8)
        SystemConnection.textColor = UIColor.blackColor()
        imageView.addSubview(SystemConnection)
        imageView.addSubview(system)
        
        
        let textField = UITextView(frame: CGRectMake(35.0, 19.0, 200.0, 160.0))
        textField.textAlignment = NSTextAlignment.Justified
        textField.textColor = UIColor.blackColor()
        textField.font = UIFont.boldSystemFontOfSize(15)
        textField.autocapitalizationType = UITextAutocapitalizationType.Words
        textField.backgroundColor = UIColor.clearColor()
        
        
        
        buttonOrangeColor.frame = CGRectMake(50, 160, 40, 28.0)
        buttonOrangeColor.layer.cornerRadius = 3
        buttonOrangeColor.titleLabel?.font = UIFont.italicSystemFontOfSize(8)
        buttonOrangeColor.layer.cornerRadius = 0.5 * buttonOrangeColor.bounds.size.width
        buttonOrangeColor.titleLabel?.textAlignment = NSTextAlignment.Center
        buttonOrangeColor.backgroundColor = UIColor.orangeColor()
        buttonOrangeColor.setTitle("Orange", forState: UIControlState.Normal)
        buttonOrangeColor.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonOrangeColor.addTarget(self, action: #selector(ViewController.buttonOrangeColorPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        buttonGreenColor.frame = CGRectMake(110, 160, 40, 28.0)
        buttonGreenColor.layer.cornerRadius = 3
        buttonGreenColor.tag = 1
        buttonGreenColor.backgroundColor = UIColor.greenColor()
        buttonGreenColor.layer.cornerRadius = 0.5 * buttonGreenColor.bounds.size.width
        buttonGreenColor.titleLabel?.font = UIFont.italicSystemFontOfSize(8)
        buttonGreenColor.titleLabel?.textAlignment = NSTextAlignment.Center
        buttonGreenColor.setTitle("Green", forState: UIControlState.Normal)
        buttonGreenColor.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonGreenColor.addTarget(self, action: #selector(ViewController.buttonGreenColorPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        buttonRedColor.frame = CGRectMake(170, 160, 40, 28.0)
        buttonRedColor.layer.cornerRadius = 3
        buttonRedColor.backgroundColor = UIColor.redColor()
        buttonRedColor.layer.cornerRadius = 0.5 * buttonRedColor.bounds.size.width
        buttonRedColor.titleLabel?.font = UIFont.italicSystemFontOfSize(8)
        buttonRedColor.titleLabel?.textAlignment = NSTextAlignment.Center
        buttonRedColor.setTitle("Red", forState: UIControlState.Normal)
        buttonRedColor.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonRedColor.addTarget(self, action: #selector(ViewController.buttonRedColorPressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        buttonDelete.frame = CGRectMake(230, 160, 40, 28.0)
        buttonDelete.layer.cornerRadius = 3
        buttonDelete.backgroundColor = UIColor.brownColor()
        buttonDelete.layer.cornerRadius = 0.5 * buttonDelete.bounds.size.width
        buttonDelete.titleLabel?.font = UIFont.italicSystemFontOfSize(8)
        buttonDelete.titleLabel?.textAlignment = NSTextAlignment.Center
        buttonDelete.setTitle("Delete", forState: UIControlState.Normal)
        buttonDelete.setTitleColor(UIColor.whiteColor(), forState: UIControlState.Normal)
        buttonDelete.addTarget(self, action: #selector(ViewController.buttonDeletePressed(_:)), forControlEvents: UIControlEvents.TouchUpInside)
        
        
        
        
        imageView.addSubview(textLabel)
        
        scrollImage.contentSize = imageView.bounds.size
        scrollImage.addSubview(imageView)
        
        
        
        
        stickerDictionary[stickerLabel] = imageView
        StickerArray.append(imageView)
        StickerArray1.append(imageView)
        
        
        
        
        let stackView = UIStackView(arrangedSubviews: StickerArray)
        
        stackView.axis = .Horizontal
        stackView.distribution = .Fill
        stackView.alignment = .Center
        stackView.spacing = 10
        //stackView.addGestureRecognizer(tap)
        //stackView.userInteractionEnabled = true
        
        
        
        
        scrollView1.addSubview(stackView)
        scrollView.addSubview(stackView)
        
        
        imageView.heightAnchor.constraintEqualToConstant(400).active = true
        imageView.widthAnchor.constraintEqualToConstant(400).active = true
        stackView.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    var doubleTap : Bool = true
    func singleTapped(sender: UITapGestureRecognizer)
    {
        
         if (doubleTap)
         {
        
        sender.view!.contentMode = UIViewContentMode.ScaleAspectFill
        sender.view?.transform = CGAffineTransformMakeScale(2, 2)
        doubleTap = false
         }
         else
         {
            sender.view?.transform = CGAffineTransformMakeScale(1, 1)
            doubleTap = true
        }
    }
    
    
    
    func doubleTapped(sender : UITapGestureRecognizer)
    {
        
        sender.view?.addSubview(buttonGreenColor)
        sender.view?.addSubview(buttonOrangeColor)
        sender.view?.addSubview(buttonRedColor)
        sender.view?.addSubview(buttonDelete)
        
        
    }
    
    
    func dragged(gesture: UIPanGestureRecognizer){
        let loc = gesture.locationInView(self.view)
        let gesturedView = gesture.view
        gesturedView!.center = loc
    }
    
}