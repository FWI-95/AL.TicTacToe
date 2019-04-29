table 50110 TicTacToeTable
{
    DataClassification = SystemMetadata;

    fields
    {
        field(1; "RowNo"; Integer)
        {
            Caption = 'RowNo';
            DataClassification = SystemMetadata;
        }
        field(10; "First"; Code[1])
        {
            Caption = 'First';
            DataClassification = SystemMetadata;
        }
        field(11; "Second"; Code[1])
        {
            Caption = 'Second';
            DataClassification = SystemMetadata;
        }

        field(12; "Third"; Code[1])
        {
            Caption = 'Third';
            DataClassification = SystemMetadata;
        }
    }

    keys
    {
        key(PK; "RowNo")
        {
            Clustered = true;
        }
    }

}