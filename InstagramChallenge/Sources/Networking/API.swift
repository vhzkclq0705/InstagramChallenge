//
//  API.swift
//  InstagramChallenge
//
//  Created by 권오준 on 2022/07/27.
//  Copyright © 2022 com.softsquared.gridgeTest.ios.InstagramChallenge.InstagramChallenge. All rights reserved.
//

import Alamofire

fileprivate func networking<T: Decodable>(
    urlStr: String,
    method: HTTPMethod,
    data: Data?,
    model: T.Type,
    completion: @escaping (Result<T, AFError>) -> Void)
{
    LoadingIndicator.showLoading()
    guard let url = URL(string: baseURL + urlStr) else {
        print("URL error")
        return }
    
    let header: HTTPHeaders = [
        "x-access-token": TokenManager.shared.jwt,
        "Content-Type": "application/json"
    ]
    
    var request = URLRequest(url: url)
    request.headers = header
    request.httpBody = data
    request.method = method
    
    AF.request(request)
        .validate(statusCode: 200..<500)
        .responseDecodable(of: model.self) { response in
            LoadingIndicator.hideLoading()
            switch response.result {
            case .success(let result):
                completion(.success(result))
            case .failure(let error):
                completion(.failure(error))
            }
        }
}

fileprivate func filtering<T: Decodable>(_ model: Response<T>) -> NetworkingResult<T> {
    if let result = model.result {
        return .success(result)
    } else {
        return .fail(model.message)
    }
}

final class API {
    static func signUp(
        _ parameter: [String: String],
        completion: @escaping (NetworkingResult<JWT>) -> Void)
    {
        guard let data = try? JSONSerialization.data(
            withJSONObject: parameter,
            options: .prettyPrinted) else { return }
        
        networking(
            urlStr: Address.signUp.url,
            method: .post,
            data: data,
            model: Response<JWT>.self) { result in
                switch result {
                case .success(let response):
                    print("signUp: \(response)")
                    completion(filtering(response))
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    static func signIn(
        _ parameter: [String: String],
        completion: @escaping (NetworkingResult<JWT>) -> Void)
    {
        guard let data = try? JSONSerialization.data(
            withJSONObject: parameter,
            options: .prettyPrinted) else { return }
        
        networking(
            urlStr: Address.signIn.url,
            method: .post,
            data: data,
            model: Response<JWT>.self) { result in
                switch result {
                case .success(let response):
                    print("signIn: \(response)")
                    completion(filtering(response))
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    static func kakaoSignUp(
        _ parameter: [String: String],
        completion: @escaping (NetworkingResult<JWT>) -> Void)
    {
        guard let data = try? JSONSerialization.data(
            withJSONObject: parameter,
            options: .prettyPrinted) else { return }
        
        networking(
            urlStr: Address.kakaoSignUp.url,
            method: .post,
            data: data,
            model: Response<JWT>.self) { result in
                switch result {
                case .success(let response):
                    print("kakaoSignUp: \(response)")
                    completion(filtering(response))
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    static func kakaoSignIn(
        _ parameter: [String: String],
        completion: @escaping (NetworkingResult<JWT>) -> Void)
    {
        guard let data = try? JSONSerialization.data(
            withJSONObject: parameter,
            options: .prettyPrinted) else { return }
        
        networking(
            urlStr: Address.kakaoSignIn.url,
            method: .post,
            data: data,
            model: Response<JWT>.self) { result in
                switch result {
                case .success(let response):
                    print("kakaoSignIn: \(response)")
                    completion(filtering(response))
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    static func autoSignIn(completion: @escaping (Bool) -> Void) {
        networking(
            urlStr: Address.autoSignIn.url,
            method: .get,
            data: nil,
            model: ResponseDefault.self) { result in
                switch result {
                case .success(let response):
                    print("autoSignIn: \(response)")
                    completion(response.isSuccess)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    static func checkDuplication(_ id: String, completion: @escaping (Bool) -> Void) {
        networking(
            urlStr: Address.duplicateID.url + "\(id)",
            method: .get,
            data: nil,
            model: ResponseDefault.self) { result in
                switch result {
                case .success(let response):
                    print("checkDuplication: \(response)")
                    completion(response.isSuccess)
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    static func searchingMyPage(_ id: String, completion: @escaping (NetworkingResult<MyPage>) -> Void) {
        networking(
            urlStr: Address.myPage.url + id + "/my-page",
            method: .get,
            data: nil,
            model: Response<MyPage>.self) { result in
                switch result {
                case .success(let response):
                    print("searchingMyPage: \(response)")
                    completion(filtering(response))
                case .failure(let error):
                    print(error)
                }
            }
    }
    
    static func searchingFeed(pageIndex: Int, size: Int, completion: @escaping (NetworkingResult<[Feed]>) -> Void) {
        networking(
            urlStr: Address.searchingFeed.url + "\(pageIndex)&size=\(size)",
            method: .get,
            data: nil,
            model: Response<[Feed]>.self) { result in
                switch result {
                case .success(let response):
                    print("searchingFeed: 성공")
                    completion(filtering(response))
                case .failure(let error):
                    print(error)
                }
            }
    }
//
//    static func searchingUser(
//        pageIndex: Int,
//        size: Int,
//        loginID: String,
//        completion: @escaping ([Feed]) -> Void)
//    {
//        networking(
//            urlStr: Address.searchingFeed.url + "\(pageIndex)&size=\(size)&loginId=\(loginID)",
//            method: .get,
//            data: nil,
//            model: Response<[Feed]>.self) { result in
//                switch result {
//                case .success(let response):
//                    print("searchingFeed: \(response)")
//                    completion(response.result)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
//
    static func createFeed(_ parameter: [String: Any], completion: @escaping (Bool) -> Void) {
        guard let data = try? JSONSerialization.data(
            withJSONObject: parameter,
            options: .prettyPrinted) else { return }

        networking(
            urlStr: Address.createFeed.url,
            method: .post,
            data: data,
            model: ResponseDefault.self) { result in
                switch result {
                case .success(let response):
                    print("createFeed: \(response)")
                    completion(response.isSuccess)
                case .failure(let error):
                    print(error)
                }
            }
    }
//
//    static func updateFeed(_ feedID: Int, completion: @escaping (String) -> Void) {
//        networking(
//            urlStr: Address.updateFeed.url + "\(feedID)",
//            method: .patch,
//            data: nil,
//            model: ResponseDefault.self) { result in
//                switch result {
//                case .success(let response):
//                    print("updateFeed: \(response)")
//                    completion(response.message)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
//
    static func deleteFeed(_ feedID: Int, completion: @escaping (Bool) -> Void) {
        networking(
            urlStr: Address.updateFeed.url + "\(feedID)/delete-status",
            method: .patch,
            data: nil,
            model: ResponseDefault.self) { result in
                switch result {
                case .success(let response):
                    print("updateFeed: \(response)")
                    completion(response.isSuccess)
                case .failure(let error):
                    print(error)
                }
            }
    }
//
//    static func searchingComments(
//        feedID: Int,
//        pageIndex: Int,
//        size: String,
//        completion: @escaping ([Comments]) -> Void)
//    {
//        networking(
//            urlStr: Address.searchingFeed.url
//            + "\(feedID)/comments?pageIndex=\(pageIndex)&size=\(size)",
//            method: .get,
//            data: nil,
//            model: Response<[Comments]>.self) { result in
//                switch result {
//                case .success(let response):
//                    print("searchingComments: \(response)")
//                    completion(response.result)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
//
//    static func createComments(
//        feedID: Int,
//        parameter: [String: String],
//        completion: @escaping (String) -> Void)
//    {
//        guard let data = try? JSONSerialization.data(
//            withJSONObject: parameter,
//            options: .prettyPrinted) else { return }
//
//        networking(
//            urlStr: Address.createComments.url + "\(feedID)/comment",
//            method: .post,
//            data: data,
//            model: ResponseDefault.self) { result in
//                switch result {
//                case .success(let response):
//                    print("createComments: \(response)")
//                    completion(response.message)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
//
    static func searchingChats(
        pageIndex: Int,
        size: Int,
        completion: @escaping (NetworkingResult<[Chat]>) -> Void)
    {
        networking(
            urlStr: Address.searchingFeed.url + "\(pageIndex)&size=\(size)",
            method: .get,
            data: nil,
            model: Response<[Chat]>.self) { result in
                switch result {
                case .success(let response):
                    print("searchingChats: \(response)")
                    completion(filtering(response))
                case .failure(let error):
                    print(error)
                }
            }
    }
//
//    static func sendChats(
//        parameter: [String: String],
//        completion: @escaping (SendChats) -> Void)
//    {
//        guard let data = try? JSONSerialization.data(
//            withJSONObject: parameter,
//            options: .prettyPrinted) else { return }
//
//        networking(
//            urlStr: Address.createComments.url,
//            method: .post,
//            data: data,
//            model: Response<SendChats>.self) { result in
//                switch result {
//                case .success(let response):
//                    print("sendChats: \(response)")
//                    completion(response.result)
//                case .failure(let error):
//                    print(error)
//                }
//            }
//    }
}
