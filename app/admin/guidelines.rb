ActiveAdmin.register Guideline do
  index do                            
    column :title  
    column :subtitle    
    column :specialty                
    column :content       
    column :hospital        
    column :user   

    default_actions                   
  end
end
