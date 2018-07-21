require 'csv'
# loads questions from csv file
class LoadQuestions
  class << self
    def perform(path = 'app/assets/nodes/nodes.csv')
      CSV.foreach(path, headers: true) do |row|
        Question.find_or_create_by(
          question_code: row[3],
          module_code: row[6],
          content: row[9],
          sort: row[4],
          kind: row[8],
          summary: row[30],
          report_summary: row[29],
          help: row[28],
          faq: row[27],
          asc: row[26],
          examples: row[25],
          conclusion_1: row[23],
          conclusion_2: row[24],
          meets_response: row[21],
          subject_id: row[5]
        )
      end
    end
  end
end
