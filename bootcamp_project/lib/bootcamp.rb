class Bootcamp
    def initialize(name, slogan, student_capacity)
        @name = name
        @slogan = slogan
        @student_capacity = student_capacity
        @teachers = []
        @students = []
        @grades = Hash.new { |h, k| h[k] = []}
    end

    def name
        @name 
    end

    def slogan
        @slogan
    end

    def teachers
        @teachers
    end

    def students
        @students
    end

    def hire(teacher)
        @teachers << teacher
    end

    def enroll(student)
        if @students.length < @student_capacity
            @students << student
            return enrolled?(student)
        else
            enrolled?(student)
        end
        
    end

    def enrolled?(student)
        @students[-1] == student ? true : false
    end

    def student_to_teacher_ratio
        @students.length / @teachers.length
    end

    def add_grade(student, grade)
        @students.include?(student) ? @grades[student] << grade && true : false
    end

    def num_grades(student)
        @grades[student].length
    end

    def average_grade(student)
        if !(@grades.has_key?(student))
            nil
        elsif @grades[student] == []
            nil
        else
            @grades[student].sum / @grades[student].length
        end
    end
end
