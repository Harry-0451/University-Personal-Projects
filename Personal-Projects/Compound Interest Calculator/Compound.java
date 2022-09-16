//
import javax.swing.*;
import java.text.DecimalFormat;
import java.awt.*;
import javax.swing.table.*;
import javax.swing.JTable;
import java.awt.event.*;
import javax.swing.table.DefaultTableModel;


public class Compound extends JPanel{

    // Assigns variables required for labels, textfields, buttons, the overall table and each column.
    private JLabel initialDepostLabel,interestRateLabel,yearsLabel,monthsLabel,regularDepositsLabel,errorLbl;
    private JTextField initialDepostField,interestRateField,yearsField,monthsField,regularDepositsField;
    private JButton calculateButton;
    public DefaultTableModel tableModel;
    public TableColumn monthCol, depositCol, interestCol, totalDepCol, accuredIntCol, balCol;

    public Compound() {
        GridBagConstraints constrain = new GridBagConstraints();
        setLayout(new GridBagLayout());

        //Padding for the grid.
        constrain.insets = new Insets(10, 0, 0, 0);


        //Creates label and input field for the deposit first entered into the balance, with a location on the grid applied.
        initialDepostLabel= new JLabel("Initial deposit: ");
        constrain.gridx = 0;
        constrain.gridy = 0;
        add(initialDepostLabel,constrain);

        initialDepostField = new JTextField(10);
        constrain.gridx = 1;
        constrain.gridy = 0;
        add(initialDepostField,constrain);


        // Creates label and input field for the interest rate applied each month, with a location on the grid applied.
        interestRateLabel = new JLabel("Interest rate: ");
        constrain.gridx = 2;
        constrain.gridy = 0;
        add(interestRateLabel,constrain);

        interestRateField = new JTextField(10);
        constrain.gridx = 3;
        constrain.gridy = 0;
        add(interestRateField,constrain);


        // Creates labels and input fields for the months and years the calculator needs to run through, with a location on the grid applied.
        yearsLabel = new JLabel("Years: ");
        constrain.gridx = 0;
        constrain.gridy = 1;
        add(yearsLabel,constrain);

        yearsField = new JTextField(10);
        constrain.gridx = 1;
        constrain.gridy = 1;
        add(yearsField,constrain);

        monthsLabel = new JLabel("Months: ");
        constrain.gridx = 2;
        constrain.gridy = 1;
        add(monthsLabel,constrain);

        monthsField = new JTextField(10);
        constrain.gridx = 3;
        constrain.gridy = 1;
        add(monthsField,constrain);


        // Creates label and input field for total amount being put into the account each month, with a location on the grid applied.
        regularDepositsLabel = new JLabel("Regular Deposits: ");
        constrain.gridx = 0;
        constrain.gridy = 2;
        add(regularDepositsLabel,constrain);

        regularDepositsField= new JTextField(10);
        constrain.gridx = 1;
        constrain.gridy = 2;
        add(regularDepositsField,constrain);


        // Creates label for error messages to be displayed for the user, with a location on the grid applied.
        errorLbl = new JLabel("");
        constrain.gridx = 0;
        constrain.gridy = 3;
        constrain.gridwidth = 4;
        add(errorLbl,constrain);
        errorLbl.setForeground(Color.red);


        // Creates a button for the user to click and calculate the compound interest of the variables provided, with a location on the grid applied.
        calculateButton = new JButton("Calculate");
        constrain.gridx = 0;
        constrain.gridy = 4;
        constrain.gridwidth = 4;
        add(calculateButton,constrain);


        //Creates a scrollable table and assigns the names of columns to the table.
        String[] columnNames = {"Month","Deposits","Interest","Total Deposits","Accrued Interest","Balance"};
        tableModel = new DefaultTableModel(); 
        JTable table = new JTable (tableModel); 
        JScrollPane scrollPane  = new JScrollPane(table);
        
        for(String columnName : columnNames){
            tableModel.addColumn(columnName);
        }


        //Gets each column and sets the width of the column so titles arent cut off.
        monthCol = table.getColumnModel().getColumn(0);
        monthCol.setPreferredWidth(35);

        depositCol = table.getColumnModel().getColumn(1);
        depositCol.setPreferredWidth(40);

        interestCol = table.getColumnModel().getColumn(2);
        interestCol.setPreferredWidth(40);

        balCol = table.getColumnModel().getColumn(5);
        balCol.setPreferredWidth(50);


        //Adds the table to the interface to be displayed for the user.
        constrain.gridx = 0;
        constrain.gridy = 5;
        constrain.ipadx = 0;
        constrain.gridwidth = 4;
        add(scrollPane,constrain);


        // Action listener looking out for user to click the calculate button. If this button is clicked then the function is ran.
        calculateButton.addActionListener(new ActionListener() {
        @Override
        public void actionPerformed(ActionEvent event) {

            // Checks each input to see if it's blank. If it is then an error is shown when user clicks calculate.
            if(initialDepostField.getText().equals("")|| interestRateField.getText().equals("") || regularDepositsField.getText().equals("") || yearsField.getText().equals("") || monthsField.getText().equals("")){
                errorLbl.setText("Error: No Fields Can Be Left Empty.");
            }
            // Checks each input to see if they contain any letters. If it is then an error is shown when user clicks calculate.
            else if(initialDepostField.getText().matches(".*[a-zA-Z]+.*") || interestRateField.getText().matches(".*[a-zA-Z]+.*") || regularDepositsField.getText().matches(".*[a-zA-Z]+.*") || yearsField.getText().matches(".*[a-zA-Z]+.*") || monthsField.getText().matches(".*[a-zA-Z]+.*")){
                errorLbl.setText("Error: Numerical Values Only.");
            }
            // Checks to see if the years and months fields contian a . (for decimal place), if it does then an error is displayed.
            else if(yearsField.getText().contains(".") || monthsField.getText().contains(".")){
                errorLbl.setText("Error: Year And Months Must Be Whole Numbers.");
            }
            // Otherwise the program begins its main purpose.
            else{

                // This resets the table and error message (incase the user has previously input information and wants to try updated values)
                tableModel.setRowCount(0);
                errorLbl.setText("");

                // Sets the users inputs into specific variables.
                double initialDepost = Double.parseDouble(initialDepostField.getText()); 
                double interestRate = Double.parseDouble(interestRateField.getText()); 
                double regularDeposits = Double.parseDouble(regularDepositsField.getText());
                Integer years = Integer.parseInt(yearsField.getText()); 
                Integer months = Integer.parseInt(monthsField.getText()); 
    
                //Runs calculate function to generate data to populate table.
                calculate(initialDepost,interestRate,regularDeposits,years,months);
            }
        }});
    }


    public void  calculate(double initialDepost, double interestRate, double regularDeposits,  Integer years, Integer months){

        // Assigns the required base values to variables.
        int totalMonths = (years * 12) + months;
        double decimalInterestRate = interestRate / 100;
        double monthlyRate =  decimalInterestRate / 12;
        double interest = 0;
        double totalDeposit = 0;
        double accruedInterest = 0;
        double balance = 0;

        // Sets outputs to 2 decimal places (for currency).
        DecimalFormat df = new DecimalFormat("#.00"); 

        // Runs this loop for each month (and starting deposit)
        for(int i = 0;i <= totalMonths; i++){

            // For each month, the month, starting deposit, interest, total deposits, 
            // accrued interest and balance are all added to the table.
            if(i == 0){
                totalDeposit += initialDepost;
                balance += initialDepost;
                tableModel.addRow(new Object[]{i,df.format(initialDepost),df.format(0),df.format(initialDepost),df.format(0),df.format(balance)});

                System.out.printf("%s %s %s %s %s %s %n",i,df.format(initialDepost),df.format(0),df.format(initialDepost),df.format(0),df.format(balance));
            }
            else{
                // The interest is calculated by multiplying the monthly rate to the current balance.
                // The total deposit is just each monthly deposit added on top of the previous months.
                // Accured interest is the balance multiplied by the monthly rate (How much interest in total has been gained)
                // The balance is the interest + regular deposits monthly.
                interest = balance * monthlyRate;
                totalDeposit += regularDeposits;
                accruedInterest +=  balance * monthlyRate;
                balance += interest + regularDeposits;

                tableModel.addRow(new Object[]{i,df.format(regularDeposits),df.format(interest),df.format(totalDeposit),df.format(accruedInterest),df.format(balance)});

                System.out.printf("%s %s %s %s %s %s %n",i,df.format(regularDeposits),df.format(interest),df.format(totalDeposit),df.format(accruedInterest),df.format(balance));
            }
        } 
    }
}