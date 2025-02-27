class Instructor
  attr_accessor :name

  @@all = []

  # initialize with a name
  def initialize(name)
    @name = name
    @@all << self
  end
  
  # Instructor.all should return all instructors
  def self.all
    @@all
  end
  
  # Instructor#pass_student should take in a student instance and test name. If there is a BoatingTest whose name and student match the values passed in, this method should update the status of that BoatingTest to 'passed'. If there is no matching test, this method should create a test with the student, that boat test name, and the status 'passed'. Either way, it should return the BoatingTest instance.
  def pass_student(student_inst, test_name)
    BoatingTest.all.each do |boatingtest|
      if boatingtest.student == student_inst && boatingtest.name == test_name
        boatingtest.status = "passed"
        return boatingtest
      end
    end
    BoatingTest.new(student_inst, test_name, status="passed", self)
  end

  # Instructor#fail_student should take in a student instance and test name. Like #pass_student, it should try to find a matching BoatingTest and update its status to 'failed'. If it cannot find an existing BoatingTest, it should create one with the name, the matching student, and the status 'failed'.
  def fail_student(student_inst, test_name)
    BoatingTest.all.each do |boatingtest|
      if boatingtest.student == student_inst && boatingtest.name == test_name
        boatingtest.status = "failed"
        return boatingtest
      end
    end
    BoatingTest.new(student_inst, test_name, status="failed", self)
  end
end