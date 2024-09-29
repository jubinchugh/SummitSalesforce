@RestResource(urlMapping = '/studentInfo/*')
global class StudentRESTService {
    global class StudentInfo
    {
        String studentName{get;set;}
        //String studentAddress{get;set;}
        //String studentPhone{get;set;}
        //String schoolName{get;set;}
    }

    @httpGet
    global static StudentInfo getStudent(){
        RestRequest request = RestContext.Request;
        String studentId = request.requestURI.substring(request.RequestURI.lastIndexOf('/')+1);
        Student__c student = [SELECT Id, Name FROM Student__c WHERE ID = :studentId];

        StudentInfo stdInfo = new StudentInfo();
        stdInfo.studentName = student.Name;

        return stdInfo;
    }
}