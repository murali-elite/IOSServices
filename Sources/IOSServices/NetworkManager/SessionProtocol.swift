//
// SessionProtocol.swift
// CalixIOSService
//
// Created by Om Prakash Tripathi on 24/06/24.
// Copyright © 2024 Calix Inc. All rights reserved.
//

import Foundation
import Alamofire

/// Protocol defining the methods for a network session.
public protocol SessionProtocol {
    /// Creates a data request.
    ///
    /// - Parameters:
    ///  - convertible: The URL or URLRequest convertible.
    ///  - method: The HTTP method.
    ///  - parameters: Optional parameters to be included in the request.
    ///  - encoding: The parameter encoding.
    ///  - headers: Optional headers to be included in the request.
    ///  - interceptor: Optional request interceptor.
    ///  - requestModifier: Optional request modifier.
    /// - Returns: A `DataRequest`.
    func request(
        _ convertible: URLConvertible,
        method: HTTPMethod,
        parameters: Parameters?,
        encoding: ParameterEncoding,
        headers: HTTPHeaders?,
        interceptor: RequestInterceptor?,
        requestModifier: Session.RequestModifier?) -> DataRequest

    /// Creates an upload request from data.
    ///
    /// - Parameters:
    ///  - data: The data to be uploaded.
    ///  - convertible: The URL or URLRequest convertible.
    ///  - method: The HTTP method.
    ///  - headers: Optional headers to be included in the request.
    ///  - interceptor: Optional request interceptor.
    ///  - fileManager: The file manager to use.
    ///  - requestModifier: Optional request modifier.
    /// - Returns: An `UploadRequest`.
    func upload(
        _ data: Data,
        to convertible: URLConvertible,
        method: HTTPMethod,
        headers: HTTPHeaders?,
        interceptor: RequestInterceptor?,
        fileManager: FileManager,
        requestModifier: Session.RequestModifier?) -> UploadRequest

    /// Creates an upload request from multipart form data.
    ///
    /// - Parameters:
    ///  - multipartFormData: The multipart form data to be uploaded.
    ///  - url: The URL convertible.
    ///  - encodingMemoryThreshold: The encoding memory threshold.
    ///  - method: The HTTP method.
    ///  - headers: Optional headers to be included in the request.
    ///  - interceptor: Optional request interceptor.
    ///  - fileManager: The file manager to use.
    ///  - requestModifier: Optional request modifier.
    /// - Returns: An `UploadRequest`.
    func upload(
        multipartFormData: @escaping (MultipartFormData) -> Void,
        to url: URLConvertible,
        usingThreshold encodingMemoryThreshold: UInt64,
        method: HTTPMethod,
        headers: HTTPHeaders?,
        interceptor: RequestInterceptor?,
        fileManager: FileManager,
        requestModifier: Session.RequestModifier?) -> UploadRequest

    /// Creates a download request.
    ///
    /// - Parameters:
    ///  - convertible: The URL or URLRequest convertible.
    ///  - method: The HTTP method.
    ///  - parameters: Optional parameters to be included in the request.
    ///  - encoding: The parameter encoding.
    ///  - headers: Optional headers to be included in the request.
    ///  - interceptor: Optional request interceptor.
    ///  - requestModifier: Optional request modifier.
    ///  - destination: The download destination.
    /// - Returns: A `DownloadRequest`.
    func download(
        _ convertible: URLConvertible,
        method: HTTPMethod,
        parameters: Parameters?,
        encoding: ParameterEncoding,
        headers: HTTPHeaders?,
        interceptor: RequestInterceptor?,
        requestModifier: Session.RequestModifier?,
        to destination: DownloadRequest.Destination?) -> DownloadRequest
}

/// Default implementations of `SessionProtocol` methods.
extension SessionProtocol {
    /// Creates a data request with default parameter values.
    ///
    /// - Parameters:
    ///  - convertible: The URL or URLRequest convertible.
    ///  - method: The HTTP method. Defaults to `.get`.
    ///  - parameters: Optional parameters to be included in the request. Defaults to `nil`.
    ///  - encoding: The parameter encoding. Defaults to `URLEncoding.default`.
    ///  - headers: Optional headers to be included in the request. Defaults to `nil`.
    ///  - interceptor: Optional request interceptor. Defaults to `nil`.
    ///  - requestModifier: Optional request modifier. Defaults to `nil`.
    /// - Returns: A `DataRequest`.
    func request(
        _ convertible: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        interceptor: RequestInterceptor? = nil,
        requestModifier: Session.RequestModifier? = nil) -> DataRequest {
            
            request(convertible,
                    method: method,
                    parameters: parameters,
                    encoding: encoding,
                    headers: headers,
                    interceptor: interceptor,
                    requestModifier: requestModifier)
        }

    /// Creates an upload request from data with default parameter values.
    ///
    /// - Parameters:
    ///  - data: The data to be uploaded.
    ///  - convertible: The URL or URLRequest convertible.
    ///  - method: The HTTP method. Defaults to `.post`.
    ///  - headers: Optional headers to be included in the request. Defaults to `nil`.
    ///  - interceptor: Optional request interceptor. Defaults to `nil`.
    ///  - fileManager: The file manager to use. Defaults to `.default`.
    ///  - requestModifier: Optional request modifier. Defaults to `nil`.
    /// - Returns: An `UploadRequest`.
    func upload(
        _ data: Data,
        to convertible: URLConvertible,
        method: HTTPMethod = .post,
        headers: HTTPHeaders? = nil,
        interceptor: RequestInterceptor? = nil,
        fileManager: FileManager = .default,
        requestModifier: Session.RequestModifier? = nil) -> UploadRequest {
            upload(data,
                   to: convertible,
                   method: method,
                   headers: headers,
                   interceptor: interceptor,
                   fileManager: fileManager,
                   requestModifier: requestModifier)
        }

    /// Creates an upload request from multipart form data with default parameter values.
    ///
    /// - Parameters:
    ///  - multipartFormData: The multipart form data to be uploaded.
    ///  - url: The URL convertible.
    ///  - encodingMemoryThreshold:
    ///     The encoding memory threshold. Defaults to `MultipartFormData.encodingMemoryThreshold`.
    ///  - method: The HTTP method. Defaults to `.post`.
    ///  - headers: Optional headers to be included in the request. Defaults to `nil`.
    ///  - interceptor: Optional request interceptor. Defaults to `nil`.
    ///  - fileManager: The file manager to use. Defaults to `.default`.
    ///  - requestModifier: Optional request modifier. Defaults to `nil`.
    /// - Returns: An `UploadRequest`.
    func upload(
        multipartFormData: @escaping (MultipartFormData) -> Void,
        to url: URLConvertible,
        usingThreshold encodingMemoryThreshold: UInt64 = MultipartFormData.encodingMemoryThreshold,
        method: HTTPMethod = .post,
        headers: HTTPHeaders? = nil,
        interceptor: RequestInterceptor? = nil,
        fileManager: FileManager = .default,
        requestModifier: Session.RequestModifier? = nil) -> UploadRequest {
            upload(multipartFormData: multipartFormData,
                   to: url,
                   usingThreshold: encodingMemoryThreshold,
                   method: method,
                   headers: headers,
                   interceptor: interceptor,
                   fileManager: fileManager,
                   requestModifier: requestModifier)
        }

    /// Creates a download request with default parameter values.
    ///
    /// - Parameters:
    ///  - convertible: The URL or URLRequest convertible.
    ///  - method: The HTTP method. Defaults to `.get`.
    ///  - parameters: Optional parameters to be included in the request. Defaults to `nil`.
    ///  - encoding: The parameter encoding. Defaults to `URLEncoding.default`.
    ///  - headers: Optional headers to be included in the request. Defaults to `nil`.
    ///  - interceptor: Optional request interceptor. Defaults to `nil`.
    ///  - requestModifier: Optional request modifier. Defaults to `nil`.
    ///  - destination: The download destination. Defaults to `nil`.
    /// - Returns: A `DownloadRequest`.
    func download(
        _ convertible: URLConvertible,
        method: HTTPMethod = .get,
        parameters: Parameters? = nil,
        encoding: ParameterEncoding = URLEncoding.default,
        headers: HTTPHeaders? = nil,
        interceptor: RequestInterceptor? = nil,
        requestModifier: Session.RequestModifier? = nil,
        to destination: DownloadRequest.Destination? = nil) -> DownloadRequest {
            download(convertible,
                     method: method,
                     parameters: parameters,
                     encoding: encoding,
                     headers: headers,
                     interceptor: interceptor,
                     requestModifier: requestModifier,
                     to: destination)
        }
}

/// Extension to make `Session` conform to `SessionProtocol`.
extension Session: SessionProtocol {}
