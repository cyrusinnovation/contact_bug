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
    # self.displayPerson(person)
    # self.dismissModalViewControllerAnimated(true)

    return true
  end

  def peoplePickerNavigationController(peoplePicker, shouldContinueAfterSelectingPerson:person,
                                  property:property, identifier:identifier)
      puts "property: #{property}, id: #{identifier}"
      #textField.textlabel.text = property.getStuff()
      record_id = ABRecordGetRecordID(person)
      puts "the record id is: #{record_id}"

      aValueFromPerson = ABRecordCopyValue(person, 0)
      puts "a puts"
      puts "a value: #{aValueFromPerson.type}"
      puts "a value: #{aValueFromPerson.to_s}"
      @current_cell.textLabel.email = aValueFromPerson
      return true
  end
  
  
end