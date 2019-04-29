page 50110 TicTacToe
{
    PageType = List;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = TicTacToeTable;
    SourceTableTemporary = true;
    InsertAllowed = false;
    ModifyAllowed = false;
    DeleteAllowed = false;



    layout
    {
        area(Content)
        {
            repeater(GroupName)
            {
                field(dummy; dummy)
                {
                    ApplicationArea = All;
                }
                field(First; First)
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    begin
                        First := 'X';
                        CalcNextMove();
                    end;
                }

                field(Second; Second)
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    begin
                        Second := 'X';
                        CalcNextMove();
                    end;
                }

                field(Third; Third)
                {
                    ApplicationArea = All;
                    trigger OnDrillDown()
                    begin
                        Third := 'X';
                        CalcNextMove();
                    end;
                }

            }
        }
    }

    actions
    {
        area(Processing)
        {
            action("New Game")
            {
                ApplicationArea = All;

                trigger OnAction()
                var
                    TTT: Page TicTacToe;
                begin
                    TTT.Run();
                    CurrPage.Close();
                end;
            }
        }
    }

    var
        dummy: Code[1];

    trigger OnOpenPage()
    var
        i: Integer;
    begin
        for i := 1 to 3 do begin
            init;
            RowNo := i;
            insert;
        end;
    end;

    local procedure CalcNextMove()
    var
        TTTCode: CodeUnit TicTacToeCode;
    begin
        reset;
        TTTCode.CalcNextMove(Rec);
        CurrPage.update(false);
    end;
}