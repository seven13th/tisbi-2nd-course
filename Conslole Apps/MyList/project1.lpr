﻿program project1;

type
  pListItem = ^TListItem;

  TListItem = record
    info: integer;
    Next: pListItem;
  end;

var
  pFirst, pTemp, pNew, pPrev: pListItem;
  menu, ainf, n: integer;

  procedure print;
  begin
    writeln;
    if pFirst^.Next = nil then
      write('Список пуст!')
    else
    begin
      pTemp := pFirst^.Next;
      write('Список: [');
      while pTemp <> nil do
      begin
        write(pTemp^.info, ' -> ');
        pTemp := pTemp^.Next;
      end;
      Write('] ')
    end;
    writeln;writeln;
  end;

procedure vivodDlyaPoiska;
begin
  writeln;
  if pFirst^.Next = nil then
    write('Cписок пуст!!')
  else
  begin
    pTemp := pFirst^.Next;
    write('Введите значение для поиска: ');
    while pTemp <> nil do
    begin
      write(pTemp^.info, ' ');
      pTemp := pTemp^.Next;
    end;
  end;
  writeln;
  writeln;
end;

  function search(ainf: integer): pListItem;
  begin
    if pFirst^.Next = nil then
      writeln('Список пуст!')
    else
    begin
      pTemp := pFirst^.Next;
      while (pTemp <> nil) do
      begin
        if (pTemp^.info = ainf) then
        begin
          Result := pTemp;
          break;
        end
        else
        begin
          pTemp := pTemp^.Next;
          Result := nil;
        end;
      end;
    end;
  end;

  function Search2(ainf: integer): pListItem;
  begin
    if pFirst^.Next = nil then
      writeln('Список пуст!')
    else
    begin
      pTemp := pFirst^.Next;
      pPrev := pFirst;
      while (pTemp <> nil) do
        if (pTemp^.info = ainf) then
        begin
          Result := pPrev;
          break;
        end
        else
        begin
          pTemp := pTemp^.Next;
          pPrev := pPrev^.Next;
          Result := nil;
        end;
    end;
  end;

  procedure pushAfter;
  begin
    WriteLn;
    if pFirst^.Next = nil then
    begin
      write('Введите значение добавляемого элемента: ');readln(n);
      pTemp := pFirst;
      new(pNew);
      pNew^.info := n;
      pNew^.Next := pTemp^.Next;
      pTemp^.Next := pNew;
    end
    else
    begin
      write('Введите значение для поиска: ');readln(ainf);
      pTemp := Search(ainf);
      if (pTemp <> nil) then
      begin
        write('Введите значение добавляемого элемента: ');readln(n);
        new(pNew);
        pNew^.info := n;
        pNew^.Next := pTemp^.Next;
        pTemp^.Next := pNew;
      end
      else
        writeln('404: Not Found!');
    end;
    WriteLn;
  end;

  procedure pushBefore;
  begin
    WriteLn;
    if pFirst^.Next = nil then
    begin
      write('Введите значение добавляемого элемента: ');readln(n);
      pTemp := pFirst;
      new(pNew);
      pNew^.info := n;
      pNew^.Next := pTemp^.Next;
      pTemp^.Next := pNew;
    end
    else
    begin
      write('Введите значение для поиска: ');readln(ainf);
      pTemp := Search(ainf);
      pPrev := Search2(ainf);
      if (pTemp <> nil) then
      begin
        write('Введите значение добавляемого элемента: ');readln(n);
        new(pNew);
        pNew^.info := n;
        pNew^.Next := pTemp;
        pPrev^.Next := pNew;
      end
      else
        writeln('404: Not Found!');
    end;
    WriteLn;
  end;

  procedure pop;
  begin
    WriteLn;
    if pFirst^.Next = nil then
      writeln('Список пуст!')
    else
    begin
      write('Введите значение для поиска: ');readln(ainf);
      pTemp := Search(ainf);
      pPrev := Search2(ainf);
      if pTemp <> nil then
      begin
        pPrev^.Next := pTemp^.Next;
        dispose(pTemp);
        WriteLn('Элемент успешно удалён.')
      end
      else
        writeln('Список пуст!');
    end;
    WriteLn;
  end;

begin
  new(pFirst);
  pFirst^.Next := nil;
  repeat
    writeln('1. Добавление элемента ПОСЛЕ');
    writeln('2. Добавление элемента ПЕРЕД');
    writeln('3. Удаление элемента списка');
    writeln('4. Вывод списка на экран');
    writeln('5. Запасный выход');
    write('Введите значение: ');readln(menu);
    case menu of
      1: pushAfter;
      2: pushBefore;
      3: pop;
      4: print;
    end;
  until menu = 5;
end.
