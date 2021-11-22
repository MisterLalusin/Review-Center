//
//  QuestionsResponseModel.swift
//  Review Center
//
//  Created by John Rovic Lalusin on 11/17/21.
//

import Foundation

class QuestionsResponseModel: Codable, Identifiable {
    var id: String? = ""
    var category: String? = ""
    var question_text: String? = ""
    var question_img: String? = ""
    var question_type: String? = ""
    var ans_a: String? = ""
    var ans_b: String? = ""
    var ans_c: String? = ""
    var ans_d: String? = ""
    var ans_a_img: String? = ""
    var ans_b_img: String? = ""
    var ans_c_img: String? = ""
    var ans_d_img: String? = ""
    var ans_correct: String? = ""
    var posted_by: String? = ""
    var deleted: String? = ""
    var created: String? = ""
}
