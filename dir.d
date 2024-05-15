import std.stdio;
import std.process;
import std.range;
import std.file;


void nxdir(){
  // writeln("tadaah");

    // Execute the dir command and capture its output
    auto process = pipeProcess(["cmd", "/c", "dir"]);

    // Read the output of the command
    string output;
    foreach (line; process.stdout.byLine())
    {
        output ~= line ~ "\n";
    }

    // Print the output
    writeln(output);
}

void nxSearch(){

    

    // Execute the dir command and capture its output   
    write("Enter file type: ");
    string ftype ="*.";
    string ftypes = readln().chomp();
    string sort_type = ftype ~ ftypes;

    
    auto process = pipeProcess(["cmd", "/c", "dir", "/b", "/o:n", sort_type]);

    // Read the output of the command
    string output;
    foreach (line; process.stdout.byLine())
    {
        output ~= line ~ "\n";
    }

    // Print the output
    writeln(output);
    writeln(sort_type);

    
}

void nxSort(){

 auto process = pipeProcess(["cmd", "/c", "dir", "/b", "/o:n", "*.*"]);

    // Read the output of the command
    string output;
    foreach (line; process.stdout.byLine())
    {
        output ~= line ~ "\n";
    }

    // Print the output
    writeln(output);
}



void nxDate(){
    
    // Execute the "date" command and capture its output
    auto process = pipeProcess(["cmd", "/c", "date /t"]);

    // Read the output of the command
    string output;
    foreach (line; process.stdout.byLine())
    {
        output ~= line;
    }

    // Print the output
    writeln("Current date:", output);

}

void nxDelete(){

 

    write("Enter the file name with file extension: ");
    string del_file = readln().chomp();
   
    if (fileExists(del_file)){
    // Execute the del command to delete a file named "example.txt"
    execute(["cmd", "/c", "del", del_file]);

    writeln("File deleted successfully");

    } else
    {
        writeln("File not found: ", del_file);
        nxDelete();
    }

 
    
}

bool fileExists(string del_file)
{
    auto process = execute(["cmd", "/c", "dir", del_file]);
   
    return process.status == 0;  // If status is 0, file exists; otherwise, it does not exist
}


string chomp(string str)
{
    // Check if the string ends with a newline character
    if (!str.empty && str[$ - 1] == '\n')
    {
        // Remove the last character
        str = str[0 .. $ - 1];
    }
    return str;
}


// Helper function to display function names
void displayFunctionNames(string[] functionNames)
{
    writeln("List of commands:");
    foreach (name; functionNames)
    {
        writeln(name);
    }
}


void main()
{
 

  // Get the names of the desired functions
    string[] functionNames = ["/nxAsk","/nxDate","/nxDir","/nxDelete", "/nxList", "/nxHelp","/nxSearch","/nxSort"];

    writeln("===========================================================");
    writeln("=                    Welcome to NexOs                     =");
    writeln("===========================================================");
    writeln();
 

while (true){

    writeln();
    
    string currentDir = std.file.getcwd();
  
    write(currentDir ~ "|NexOS>");
   
    string nxdir_input = readln().chomp(); // Read user input and remove trailing newline
    

    if (nxdir_input == "exit"){

        writeln("program exiting");
        break;

    }


    if(nxdir_input == "nxDir"){
        nxdir();
   
    } else if (nxdir_input == "nxList"){

    writeln("Here's the commands for NexOs");
    // Call the helper function to display function names
    displayFunctionNames(functionNames);

    } else if (nxdir_input == "nxDate"){

        nxDate();

    } else if (nxdir_input == "nxAsk"){

    write("Enter NexOS Command: ");
    string asknxos = readln().chomp();

        if (asknxos == "nxList"){

            writeln("/nxlist        list all of the commands in NexOs");
  
        } else if (asknxos == "nxDir"){

             writeln("/nxdir        list the files directory saved in the folder");

        } else if (asknxos == "nxDate"){

             writeln("/nxDate   display current date");

        } else {

             writeln("invalid command");
        }
    } else if (nxdir_input == "nxHelp"){

        writeln("/nxAsk        display specific command function");
        writeln("/nxDate       display current date");
        writeln("/nxDelete     deletes a file");
        writeln("/nxDir        list the files directory saved in the folder");
        writeln("/nxHelp       list all of the commands in NexOs and its fucntions");
        writeln("/nxList       list all of the commands in NexOs");
        writeln("/nxSearch     Sort specific files based on file type");
        writeln("/nxSort       Sort all files based on file type");

    } else if (nxdir_input == "nxSort"){

        nxSort();

    } else if (nxdir_input == "nxSearch"){

        nxSearch();

    }  else if (nxdir_input == "nxDelete"){

        nxDelete();

    } else  {       
        writeln("invalid command");
    }

} 


}
    
    

   




  
