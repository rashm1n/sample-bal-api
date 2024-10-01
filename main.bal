import ballerina/http;
import ballerina/io;

// Create a listener to receive HTTP requests.
listener http:Listener server = new(8080);

configurable string textFilePath1 = "./something.txt";

// Define a service on the created listener.
service / on server {

    // Resource that returns HTTP 200.
    resource function get status200(http:Caller caller, http:Request req) returns error?{
        string textContent = "Ballerina is an open source programming language.";
        check io:fileWriteString(textFilePath1, textContent);
        string readContent = check io:fileReadString(textFilePath1);
        io:println(readContent);
        http:Response res = new;
        res.statusCode = 200;
        res.setPayload("OK - Status 200");
        check caller->respond(res);
    }

    // Resource that returns HTTP 400.
    resource function get status400(http:Caller caller, http:Request req) returns error?{
        string textContent = "Ballerina is an open source programming language.";
        check io:fileWriteString(textFilePath1, textContent);
        string readContent = check io:fileReadString(textFilePath1);
        io:println(readContent);
        http:Response res = new;
        res.statusCode = 400;
        res.setPayload("Bad Request - Status 400");
        check caller->respond(res);
    }

    resource function get status401(http:Caller caller, http:Request req) returns error?{
        string textContent = "Ballerina is an open source programming language.";
        check io:fileWriteString(textFilePath1, textContent);
        string readContent = check io:fileReadString(textFilePath1);
        io:println(readContent);
        http:Response res = new;
        res.statusCode = 401;
        res.setPayload("Bad Request - Status 401");
        check caller->respond(res);
    }

    // Resource that returns HTTP 500.
    resource function get status500(http:Caller caller, http:Request req) returns error?{
        string textContent = "Ballerina is an open source programming language.";
        check io:fileWriteString(textFilePath1, textContent);
        string readContent = check io:fileReadString(textFilePath1);
        io:println(readContent);
        http:Response res = new;
        res.statusCode = 500;
        res.setPayload("Internal Server Error - Status 500");
        check caller->respond(res);
    }

    // Resource that returns HTTP 201.
    resource function get status201(http:Caller caller, http:Request req) returns error?{
        string textContent = "Ballerina is an open source programming language.";
        check io:fileWriteString(textFilePath1, textContent);
        string readContent = check io:fileReadString(textFilePath1);
        io:println(readContent);
        http:Response res = new;
        res.statusCode = 201;
        res.setPayload("Created - Status 201");
        check caller->respond(res);
    }
}

