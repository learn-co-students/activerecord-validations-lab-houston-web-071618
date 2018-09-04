class MyValidator < ActiveModel::Validator
    def validate(record)
        click_bait_phrases = ["Won't Believe", "Secret", "Top ", "Guess"]
        click_bait_phrases.each do |phrase| 
            if (record.title && record.title.include?(phrase))
                return true
            end
        end
        record.errors[:name] << 'Need a name starting with X please!'
    end
end