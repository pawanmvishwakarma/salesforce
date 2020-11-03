// Use .apex files to store anonymous Apex.
// You can execute anonymous Apex in VS Code by selecting the
//     apex text and running the command:
//     SFDX: Execute Anonymous Apex with Currently Selected Text
// You can also execute the entire file by running the command:
//     SFDX: Execute Anonymous Apex with Editor Contents

// Id batchInstanceId = Database.executeBatch(new SendEmaiToContact(), 5); 
// System.debug('batchInstanceId ====>>>> '+batchInstanceId);


// String cornExpression = '0 2 5 1/1 * ? *';
// ScheduleEmail scheduleJob = new ScheduleEmail();
// String jobId = System.schedule('Account Industry', cornExpression, scheduleJob);

// System.debug(jobId);

List<Shape> lsObj = new List<Shape>();

lsObj.add(new Circle(3));
lsObj.add(new Square(2));
lsObj.add(new Circle(4));
lsObj.add(new Square(5));
lsObj.add(new Rectangle(5, 2));
lsObj.add(new Rectangle(3, 4));

AreaCalculator a = new AreaCalculator(lsObj);

System.debug(a.areaSum());