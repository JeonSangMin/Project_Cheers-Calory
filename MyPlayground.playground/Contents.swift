import UIKit

let jsonData = """
{"RESULT":{"MSG":"정상처리되었습니다.","CODE":"INFO-000"},"total_count":"28780","row":[{"NUTR_CONT3":"2.75","NUTR_CONT2":"10.9","SERVING_SIZE":"20","NUTR_CONT1":"55.92","FOOD_GROUP":"","MAKER_NAME":"","BGN_YEAR":"","NUTR_CONT9":"0.01","NUTR_CONT8":"0.19","FOOD_CD":"D00200","NUTR_CONT7":"8.57","NUTR_CONT6":"296.34","NUTR_CONT5":"4.55","NUTR_CONT4":"0.15","DESC_KOR":"쥐치채","SUB_REF_NAME":"식약('13) 제2권","GROUP_NAME":"무침류","RESEARCH_YEAR":"2019","NUM":"200","ANIMAL_PLANT":""},{"NUTR_CONT3":"2.9","NUTR_CONT2":"22.7","SERVING_SIZE":"250","NUTR_CONT1":"149","FOOD_GROUP":"","MAKER_NAME":"","BGN_YEAR":"","NUTR_CONT9":"0","NUTR_CONT8":"0.8","FOOD_CD":"D00201","NUTR_CONT7":"0","NUTR_CONT6":"724.02","NUTR_CONT5":"1.8","NUTR_CONT4":"5.2","DESC_KOR":"청포묵무침","SUB_REF_NAME":"식약('15) 제3권","GROUP_NAME":"무침류","RESEARCH_YEAR":"2019","NUM":"201","ANIMAL_PLANT":""},{"NUTR_CONT3":"3.55","NUTR_CONT2":"12.26","SERVING_SIZE":"100","NUTR_CONT1":"97.5","FOOD_GROUP":"","MAKER_NAME":"","BGN_YEAR":"","NUTR_CONT9":"0.03","NUTR_CONT8":"0.73","FOOD_CD":"D00202","NUTR_CONT7":"47.24","NUTR_CONT6":"260.4","NUTR_CONT5":"0.4","NUTR_CONT4":"3.81","DESC_KOR":"탕평채","SUB_REF_NAME":"식약('14) 명절","GROUP_NAME":"무침류","RESEARCH_YEAR":"2019","NUM":"202","ANIMAL_PLANT":""},{"NUTR_CONT3":"1.14","NUTR_CONT2":"5.95","SERVING_SIZE":"30","NUTR_CONT1":"34.51","FOOD_GROUP":"","MAKER_NAME":"","BGN_YEAR":"","NUTR_CONT9":"0.01","NUTR_CONT8":"0.14","FOOD_CD":"D00203","NUTR_CONT7":"0","NUTR_CONT6":"244.01","NUTR_CONT5":"2.6","NUTR_CONT4":"0.68","DESC_KOR":"파래무침","SUB_REF_NAME":"식약('13) 제2권","GROUP_NAME":"무침류","RESEARCH_YEAR":"2019","NUM":"203","ANIMAL_PLANT":""},{"NUTR_CONT3":"3.2","NUTR_CONT2":"17.8","SERVING_SIZE":"150","NUTR_CONT1":"131","FOOD_GROUP":"","MAKER_NAME":"","BGN_YEAR":"","NUTR_CONT9":"0","NUTR_CONT8":"0.6","FOOD_CD":"D00204","NUTR_CONT7":"0","NUTR_CONT6":"679.07","NUTR_CONT5":"10.6","NUTR_CONT4":"5.2","DESC_KOR":"파무침","SUB_REF_NAME":"식약('15) 제3권","GROUP_NAME":"무침류","RESEARCH_YEAR":"2019","NUM":"204","ANIMAL_PLANT":""},{"NUTR_CONT3":"17.85","NUTR_CONT2":"25.95","SERVING_SIZE":"200","NUTR_CONT1":"198.94","FOOD_GROUP":"","MAKER_NAME":"","BGN_YEAR":"","NUTR_CONT9":"0","NUTR_CONT8":"0.36","FOOD_CD":"D00205","NUTR_CONT7":"57.03","NUTR_CONT6":"802.04","NUTR_CONT5":"14.46","NUTR_CONT4":"2.63","DESC_KOR":"홍어무침","SUB_REF_NAME":"식약('13) 제2권/명절","GROUP_NAME":"무침류","RESEARCH_YEAR":"2019","NUM":"205","ANIMAL_PLANT":""},{"NUTR_CONT3":"3.66","NUTR_CONT2":"34.11","SERVING_SIZE":"100","NUTR_CONT1":"165.29","FOOD_GROUP":"","MAKER_NAME":"","BGN_YEAR":"","NUTR_CONT9":"0.01","NUTR_CONT8":"0.45","FOOD_CD":"D00206","NUTR_CONT7":"3.51","NUTR_CONT6":"342.92","NUTR_CONT5":"0.21","NUTR_CONT4":"1.58","DESC_KOR":"고추장불고기 삼각김밥","SUB_REF_NAME":"식약('12) 제1권","GROUP_NAME":"밥류","RESEARCH_YEAR":"2019","NUM":"206","ANIMAL_PLANT":""},{"NUTR_CONT3":"10.3","NUTR_CONT2":"98.9","SERVING_SIZE":"350","NUTR_CONT1":"521.83","FOOD_GROUP":"","MAKER_NAME":"","BGN_YEAR":"","NUTR_CONT9":"0","NUTR_CONT8":"0.9","FOOD_CD":"D00207","NUTR_CONT7":"0","NUTR_CONT6":"90.62","NUTR_CONT5":"0","NUTR_CONT4":"9.5","DESC_KOR":"곤드레나물밥","SUB_REF_NAME":"식약('16) 제4권","GROUP_NAME":"밥류","RESEARCH_YEAR":"2019","NUM":"207","ANIMAL_PLANT":""},{"NUTR_CONT3":"27.6","NUTR_CONT2":"58.6","SERVING_SIZE":"800","NUTR_CONT1":"418.35","FOOD_GROUP":"","MAKER_NAME":"","BGN_YEAR":"","NUTR_CONT9":"0.2","NUTR_CONT8":"2.7","FOOD_CD":"D00208","NUTR_CONT7":"47.81","NUTR_CONT6":"2301.55","NUTR_CONT5":"0.4","NUTR_CONT4":"8.2","DESC_KOR":"국밥","SUB_REF_NAME":"식약('16) 제4권","GROUP_NAME":"밥류","RESEARCH_YEAR":"2019","NUM":"208","ANIMAL_PLANT":""},{"NUTR_CONT3":"7.26","NUTR_CONT2":"57.57","SERVING_SIZE":"200","NUTR_CONT1":"317.68","FOOD_GROUP":"","MAKER_NAME":"","BGN_YEAR":"","NUTR_CONT9":"0.06","NUTR_CONT8":"2.75","FOOD_CD":"D00209","NUTR_CONT7":"40.49","NUTR_CONT6":"833.29","NUTR_CONT5":"0.5","NUTR_CONT4":"6.48","DESC_KOR":"김밥","SUB_REF_NAME":"식약('12) 제1권","GROUP_NAME":"밥류","RESEARCH_YEAR":"2019","NUM":"209","ANIMAL_PLANT":""},{"NUTR_CONT3":"10.93","NUTR_CONT2":"60.67","SERVING_SIZE":"250","NUTR_CONT1":"344.97","FOOD_GROUP":"","MAKER_NAME":"","BGN_YEAR":"","NUTR_CONT9":"0.05","NUTR_CONT8":"1.58","FOOD_CD":"D00210","NUTR_CONT7":"74.17","NUTR_CONT6":"1145.54","NUTR_CONT5":"1.86","NUTR_CONT4":"6.51","DESC_KOR":"김치김밥","SUB_REF_NAME":"식약('12) 제1권","GROUP_NAME":"밥류","RESEARCH_YEAR":"2019","NUM":"210","ANIMAL_PLANT":""}]}
""".data(using: .utf8)!

struct I2790: Decodable {
    let row: [Food]
    
    private enum CodingKeys: String, CodingKey {
        case row
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        row = try container.decode([Food].self, forKey: .row)
    }
}

struct Foods {
    var foodName: String = ""
    var foodCode: String = ""
    var calory: String = ""
}

struct Food: Decodable {
    let foodName: String
    let foodCode: String
    let calory: String
    
    private enum CodingKeys: String, CodingKey {
        case foodName = "DESC_KOR"
        case foodCode = "FOOD_CD"
        case calory = "NUTR_CONT1"
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        foodName = try container.decode(String.self, forKey: .foodName)
        foodCode = try container.decode(String.self, forKey: .foodCode)
        calory = try container.decode(String.self, forKey: .calory)
    }
    
}
var foodArr = [Foods]()

if let food = try? JSONDecoder().decode(I2790.self, from: jsonData) {
    for i in food.row {
        foodArr.append(Foods(foodName: i.foodName, foodCode: i.foodCode, calory: i.calory))
    }
} else {
    print("왜 안됨")
}

print(foodArr)
