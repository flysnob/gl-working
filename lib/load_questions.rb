require 'csv'
# loads questions from csv file
class LoadQuestions
  class << self
    def perform(path = 'app/assets/nodes/nodes.csv')
      CSV.foreach(path, { quote_char: "~", headers: true }) do |row|
        Question.find_or_create_by(
          question_code: row[3],
          module_code: row[6],
          content: row[9] ? row[9].gsub('|', ',') : nil,
          sort: row[4],
          kind: row[8],
          summary: row[30] ? row[30].gsub('|', ',') : nil,
          report_summary: row[29] ? row[29].gsub('|', ',') : nil,
          help: row[28] ? row[28].gsub('|', ',') : nil,
          faq: row[27] ? row[27].gsub('|', ',') : nil,
          asc: row[26] ? row[26].gsub('|', ',') : nil,
          examples: row[25] ? row[25].gsub('|', ',') : nil,
          conclusion_1: row[23] ? row[23].gsub('|', ',') : nil,
          conclusion_2: row[24] ? row[24].gsub('|', ',') : nil,
          meets_response: row[21],
          subject_id: row[5].to_i,
          report_content: row[31] ? row[31].gsub('|', ',') : nil
        )
      end
    end
  end
end
