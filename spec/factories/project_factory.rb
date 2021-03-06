FactoryGirl.define do

  PROJECT_NAMES ||= ['Website Development', 'Database Maintenance', 'Cooking Coffee', 'Accounting', 'In-Database-Memory']

  factory :project, class: 'Project' do
    sequence(:title) { |n| PROJECT_NAMES[(n.to_i - 1) % PROJECT_NAMES.length]}
    chair
  end
end
