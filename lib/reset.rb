# loads questions from csv file
class Reset
  class << self
    def perform
      Project.all.each(&:destroy)
      VersionNode.all.each(&:destroy)
      Question.all.each(&:destroy)

      LoadQuestions.perform
      LoadVersionNodes.perform
    end
  end
end
