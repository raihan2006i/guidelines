ActiveAdmin.register Comment, :as => "PostComment"  do
  index do                            
    column :body  
    column :commenter  
    column :guideline              
   
  default_actions 

end
end
