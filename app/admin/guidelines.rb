ActiveAdmin.register Guideline do
	
  index do                            
    column :title   
    column :specialty                
    column :content       
    column :hospital        
    column :user
    column :comments   

    default_actions                   
  end


end
