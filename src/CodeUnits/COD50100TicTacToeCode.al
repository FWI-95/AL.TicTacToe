codeunit 50110 TicTacToeCode
{
    var
        gamefield: List of [List of [Code[1]]];
        RowList: List of [Code[1]];
        RowLoop: Integer;
        ColLoop: Integer;

    procedure CalcNextMove(var TTT: Record TicTacToeTable)
    begin
        clear(gamefield);
        TTT.reset();
        if TTT.findset() then
            repeat
                clear(RowList);
                RowList.add(TTT.First);
                RowList.add(TTT.Second);
                RowList.add(TTT.Third);
                gamefield.add(RowList);
            until TTT.next = 0;
        if CheckRows() or CheckCols() then begin
            message('You won');
            exit;
        end;
        For RowLoop := 1 to gamefield.count() do begin
            for ColLoop := 1 to RowList.count() do begin
                RowList := gamefield.get(RowLoop);
                if RowList.get(ColLoop) = '' then
                    if WouldBeWinningMove(RowLoop, ColLoop) then begin
                        MakeMove(TTT, RowLoop, ColLoop);
                        exit;
                    end;
            end;
        end;



        if CheckRows() or CheckCols() then begin
            message('I won');
            exit;
        end;

    end;

    local procedure WouldBeWinningMove(Row: Integer; Col: Integer): Boolean
    var
        tmpgamefield: List of [List of [Code[1]]];
        CurRow: List of [Code[1]];
        i: Integer;
        j: Integer;
    begin
        clear(tmpgamefield);
        tmpgamefield := gamefield;

        CurRow := tmpgamefield.get(Row);

        CurRow.set(Col, 'O');
        tmpgamefield.set(Row, CurRow);

    end;

    local procedure MakeMove(var TTT: Record TicTacToeTable; Row: Integer; Col: Integer)
    begin
        TTT.get(Row);
        case Col of
            1:
                TTT.first := 'O';
            2:
                TTT.Second := 'O';
            3:
                TTT.Third := 'O';
        end;
        TTT.Modify();
    end;

    local procedure CheckRows(): Boolean
    var
        i: Integer;
    begin
        for i := 1 to gamefield.count() do begin
            if LineWon(gamefield.get(i)) then
                exit(true);
        end;
    end;

    local procedure CheckCols(): Boolean
    var
        tmpList: List of [Code[1]];
        CurRow: List of [Code[1]];
        i: Integer;
        r: Integer;
    begin
        clear(tmpList);

        for i := 1 to 3 do begin
            for i := 1 to 3 do begin
                CurRow := gamefield.get(i);
                tmpList.add(CurRow.get(i));
            end;
            if LineWon(tmpList) then
                exit(true);
        end;

    end;

    procedure LineWon(Row: List of [Code[1]]): Boolean
    var
        i: Integer;
    begin
        for i := 1 to Row.count() - 1 do begin
            if (Row.get(i) <> Row.get(i + 1)) and (Row.get(i) <> '') then
                exit(false);
        end;
        exit(true);
    end;
}