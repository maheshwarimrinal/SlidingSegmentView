# SlidingSegmentView

## Step 1 :
Create number of UIView's you want to switch.

Create **FirstView.swift** and **SeconView.swift**, add content to them the way you wat to display.

## Step 2: 

In **ViewController.swift** create `UISegmentControl` and `contentView`

```
let segmentViewController : UISegmentedControl = {
    let segmentControl = UISegmentedControl(items: ["FirstView","SecondView"])
    segmentControl.selectedSegmentIndex = 0
    segmentControl.addTarget(self, action: #selector(selectIndex(sender:)), for: .valueChanged)
    segmentControl.translatesAutoresizingMaskIntoConstraints = false
    return segmentControl
}()

let contentView : UIView = {
    let view = UIView()
    view.translatesAutoresizingMaskIntoConstraints = false
    return view
}()
```
and add it into **viewDidLoad()**
```
override func viewDidLoad() {
    super.viewDidLoad()
    view.addSubview(segmentViewController)
    view.addSubview(contentView)
    setLayout()
    setPersonalView()
}
```

## Step 3:

Create method `setLayout()` to set constraints programmatically

```
func setLayout(){
    NSLayoutConstraint.activate([
        segmentViewController.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
        segmentViewController.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor, constant: 20),
        segmentViewController.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor, constant: -20),
        segmentViewController.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor),
        segmentViewController.heightAnchor.constraint(equalToConstant: 30),
        
        contentView.topAnchor.constraint(equalTo: segmentViewController.bottomAnchor, constant: 20),
        contentView.bottomAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.bottomAnchor),
        contentView.leadingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leadingAnchor),
        contentView.trailingAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.trailingAnchor)
    ])
}
```

## Step 4:

Add function `selectIndex(sender: UISegmentedControl)`so that we can identify when segment is changed

```
@objc func selectIndex(sender: UISegmentedControl){
    if sender.selectedSegmentIndex == 0{
        setPersonalView()
    }
    if sender.selectedSegmentIndex == 1{
        view.reloadInputViews()
        firstView.isHidden = true
        secondView.isHidden = false
        contentView.addSubview(secondView)
        secondView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            secondView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            secondView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            secondView.topAnchor.constraint(equalTo: contentView.topAnchor),
            secondView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
            secondView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
        ])
        view.layoutIfNeeded()
    }
}
```

## Step 5:

create function `setStartView()`

```
func setStartView(){
    contentView.addSubview(firstView)
    firstView.isHidden = false
    secondView.isHidden = true
    firstView.translatesAutoresizingMaskIntoConstraints = false
    NSLayoutConstraint.activate([
        firstView.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
        firstView.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
        firstView.topAnchor.constraint(equalTo: contentView.topAnchor),
        firstView.bottomAnchor.constraint(equalTo: contentView.bottomAnchor),
        firstView.widthAnchor.constraint(equalTo: contentView.widthAnchor)
    ])
    view.layoutIfNeeded()
}
```
