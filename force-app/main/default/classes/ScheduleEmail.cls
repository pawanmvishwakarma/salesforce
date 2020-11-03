public class ScheduleEmail implements Schedulable {
    private List<Account> accountList = [SELECT Id, Name, Industry FROM Account LIMIT 10];
    public void execute(SchedulableContext sc) {
        for (Account acc : accountList) {
            acc.Industry = 'Banking';
        }
        update accountList;
    }
}
