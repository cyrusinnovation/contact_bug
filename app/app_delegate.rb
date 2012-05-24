class AppDelegate
  
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = SampleViewController.alloc.init
    @window.rootViewController.wantsFullScreenLayout = true
    @window.makeKeyAndVisible
    true
  end
 
end

class SampleViewController < UIViewController
  
  def viewDidLoad
    @action = UIButton.buttonWithType(UIButtonTypeContactAdd)
    @action.setTitle('Pick a Contact')
    @action.addTarget(self, action:'showPicker', forControlEvents:UIControlEventTouchUpInside)
    @action.frame = [[20,0], [100,100]]
    view.addSubview(@action)
  end
  
  def showPicker
    picker = ABPeoplePickerNavigationController.alloc.init
    picker.peoplePickerDelegate = self
    self.presentModalViewController(picker,animated:true)
  end  
  
  def peoplePickerNavigationControllerDidCancel(peoplePicker)
    self.dismissModalViewControllerAnimated(true)
    @current_cell = nil
  end


  def peoplePickerNavigationController(peoplePicker, shouldContinueAfterSelectingPerson:person)
    return true
  end

  def peoplePickerNavigationController(peoplePicker, shouldContinueAfterSelectingPerson:person,
                                  property:property, identifier:identifier)
      # record_id = ABRecordGetRecordID(person)
      # puts "the record id is: #{record_id}"
      puts "About to copy value"
      first_name = ABRecordCopyValue(person, KABPersonFirstNameProperty)
      puts "First name: #{first_name}"
      return true
  end
  
  
end
