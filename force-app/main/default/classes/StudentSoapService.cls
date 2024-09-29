global class StudentSoapService {
    webService static Student__c getStudent(String studentId){
        Student__c stu = [SELECT Id, Student_Name__c, School__c FROM Student__c WHERE Id = :studentId];
        return stu;
    }
}