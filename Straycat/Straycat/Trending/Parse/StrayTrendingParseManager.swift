//
//  StrayTrendingParseManager.swift
//  Straycat
//
//  Created by Harry Twan on 16/03/2018.
//  Copyright © 2018 Harry Twan. All rights reserved.
//

import UIKit
import Alamofire
import SwiftSoup

class StrayTrendingParseManager: NSObject {
    
    /// Trending 种类
    enum TrendingType {
        /// Repo: https://github.com/trending
        case repository
        /// Repo: https://github.com/trending/developers
        case developer
    }
    
    /// 筛选 Item
    enum TrendingTimeRange: String {
        /// today
        case today = "daily"
        /// this week
        case thisWeek = "weekly"
        /// this month
        case thisMonth = "monthly"
    }
    
    static let shared = StrayTrendingParseManager()
}

extension StrayTrendingParseManager {
    /// 获取 Trending Repo 信息
    public func fetch(_ type: TrendingType = .repository,
                      language: String = "all",
                      time: TrendingTimeRange = .today,
                      completion: @escaping (Bool, [StrayTrendingRepo]?) -> Void) {
        guard let url = URL(string: "https://github.com/trending") else {
            return
        }
        Alamofire.request(url).responseString(queue: nil, encoding: .utf8) {
            response in
            switch response.result {
            case .success(let data):
                print(data)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
