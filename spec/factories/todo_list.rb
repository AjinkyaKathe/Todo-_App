  FactoryGirl.define do
    factory :todo_list do
      title "Trip"
      #descripition "Relax and Move"
    end

    factory :invalid_todo_list, parent: :todo_list do |f|
      f.title nil
    end

  end