class AppDelegate
  
  def application(application, didFinishLaunchingWithOptions:launchOptions)
    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = ABPeoplePickerNavigationController.alloc.init
    @window.rootViewController.peoplePickerDelegate = self
    @window.makeKeyAndVisible
    true
  end

  def peoplePickerNavigationController(peoplePicker, shouldContinueAfterSelectingPerson:person,
                                  property:property, identifier:identifier)

      puts
      puts ">>>>>>>> Getting the record id"
      record_id = ABRecordGetRecordID(person)
      puts ">>>>>>>> the record id is: #{record_id}"

      puts ">>>>>>>> About to get first name"
      first_name = ABRecordCopyValue(person, KABPersonFirstNameProperty)
      puts ">>>>>>>> Here's the first name: #{first_name}"
      return true
  end

  def peoplePickerNavigationControllerDidCancel(peoplePicker)
    # left blank
  end

  def peoplePickerNavigationController(peoplePicker, shouldContinueAfterSelectingPerson:person)
    return true
  end

 
end
