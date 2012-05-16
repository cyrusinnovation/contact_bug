class Email < NSManagedObject
  def self.entity
    @entity ||= begin
      # Create the entity for our EMail class. The entity has 3 properties. CoreData will appropriately define accessor methods for the properties.
      entity = NSEntityDescription.alloc.init
      entity.name = 'Email'
      entity.managedObjectClassName = 'Email'
      entity.properties = 
        ['email', NSStringAttributeType,
         'index', NSInteger16AttributeType].each_slice(2).map do |name, type|
            property = NSAttributeDescription.alloc.init
            property.name = name
            property.attributeType = type
            property.optional = false
            property
          end
      entity
    end
  end 
end
