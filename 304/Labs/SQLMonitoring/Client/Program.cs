using System.Data.SqlClient;

// See https://aka.ms/new-console-template for more information
if(args.Length < 1){
    System.Console.WriteLine("Please provide password...");
    return;
}
SqlConnectionStringBuilder builder = new SqlConnectionStringBuilder();
builder.DataSource = "sai-sqlserver-304.database.windows.net,1433"; 
builder.UserID = "saiadmin";            
builder.Password = args[0];     
builder.InitialCatalog = "TasksDb";

 using (SqlConnection connection = new SqlConnection(builder.ConnectionString))
{
    Console.WriteLine("\nQuery data example:");
    Console.WriteLine("=========================================\n");
    
    connection.Open();

    String sql = "SELECT id,name from dbo.Task";

    using (SqlCommand command = new SqlCommand(sql, connection))
    {
        using (SqlDataReader reader = command.ExecuteReader())
        {
            while (reader.Read())
            {
                Console.WriteLine("{0} {1}", reader[0], reader[1]);
            }
        }
    }          
}