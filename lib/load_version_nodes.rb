require 'csv'
# loads version_nodes from csv
class LoadVersionNodes
  class << self
    def perform(path = 'app/assets/nodes/nodes.csv')
      CSV.foreach(path, headers: true) do |row|
        next unless VersionNode.where(
											version: Version.find_by(module_code: row[6]),
            					question: Question.find_by(question_code: row[3])
										).nil?
        VersionNode.find_or_create_by(
          response_1: row[11],
          target_1: row[12],
          response_2: row[13],
          target_2: row[14],
          response_3: row[15],
          target_3: row[16],
          target_module: row[18],
          return_node: row[17],
          decision_node: row[20],
          boolean: row[22],
          meets_response: row[21],
          return: row[19],
          version: Version.find_by(module_code: row[6]),
          question: Question.find_by(question_code: row[3])
        )
      end
    end
  end
end
