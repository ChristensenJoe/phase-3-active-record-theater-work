class Role < ActiveRecord::Base
    has_many :auditions

    def actors
        self.auditions.map do |audition|
            audition.actor
        end
    end

    def locations
        self.auditions.map do |audition|
            audition.location
        end
    end

    def lead
        hired_audition = self.auditions.find do |audition|
            audition.hired
        end

        if hired_audition.nil?
            "no actor has been hired for this role"
        else
            hired_audition
        end
    end

    def understudy
        count = 0
        hired_audition = self.auditions.find do |audition|
            if audition.hired
                count += 1
            end
            count == 2
        end

        if hired_audition.nil?
            "no actor has been hired for this role"
        else
            hired_audition
        end
    end
end