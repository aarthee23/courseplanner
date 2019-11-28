ActiveAdmin.register UserCourseSelection do

 permit_params :course_plan_id, :course_id, :professor, :quarter, :day, :hours_of_preparation, :rating, :bid_points, :pre_req
# See permitted parameters documentation:
# https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
#
# permit_params :list, :of, :attributes, :on, :model
#
# or
#
# permit_params do
#   permitted = [:permitted, :attributes]
#   permitted << :other if params[:action] == 'create' && current_user.admin?
#   permitted
# end

end
