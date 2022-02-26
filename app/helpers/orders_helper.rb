module OrdersHelper
    def status_color 
        if order.status == 'Pendding Approvals'  
          'danger'  
        elsif order.status == 'In Progress' 
          'success' 
        end
    end
end
