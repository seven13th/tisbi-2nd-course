﻿program project1;

type
  pSTreeNode = ^TSTreeNode;

  TSTreeNode = record
    key, kol: integer;
    left: pSTreeNode;
    right: pSTreeNode;
    copy: pSTReeNode;
    //добавить ещё одно поле для добавления неуникальных узлов
    //чтобы не сломалась структура
  end;

var
  pRoot, pResult, pParent, pTemp: pSTreeNode;
  menu: byte;
  sKey, NewKey, kol_i: integer;

  function Search(akey: integer): pSTreeNode;
  begin
    pTemp := pRoot;
    Result := nil;
    while (pTemp <> nil) do
    begin
      if (akey = pTemp^.key) then
      begin
        WriteLn('Элемент найден: ', pTemp^.key);
        Result := pTemp;
        break;
      end
      else if (akey < pTemp^.key) then
      begin
        pParent := pTemp;
        pTemp := pTemp^.left;
      end
      else
      begin
        pParent := pTemp;
        pTemp := pTemp^.right;
      end;
    end;
  end;

  procedure AddNode(var pTemp: pSTreeNode; akey: integer);
  begin
    if (pTemp = nil) then
    begin
      New(pTemp);
      pTemp^.key := akey;
      pTemp^.left := nil;
      pTemp^.right := nil;
      pTemp^.kol := 1;
      kol_i := pTemp^.kol;
    end
    else if (akey < pTemp^.key) then
      AddNode(pTemp^.left, akey)
    else if (akey > pTemp^.key) then
      AddNode(pTemp^.right, akey)
    //обработка неуникального ключа
    else
    begin
      WriteLn('Такой ключ уже существует! Добавляю неуникальный ключ.');
      New(pTemp);
      pTemp^.key := akey;
      pTemp^.left := nil;
      pTemp^.right := nil;
      pTemp^.kol := kol_i + 1;
      kol_i := pTemp^.kol;
    end;
  end;

  procedure Print(pTemp: pSTreeNode; tabs: integer);
  var
    i: integer;
  begin
    pTemp:=pRoot;
    if (pTemp <> nil) then
      with pTemp^ do
      begin
        Print(pTemp^.left, tabs + 4);
        for i := 0 to tabs do
          Write(' ');
        WriteLn('   /');
        for i := 0 to tabs do
          Write(' ');
        WriteLn('  ', pTemp^.key, ' (', pTemp^.kol, ')');
        for i := 0 to tabs do
          Write(' ');
        WriteLn('   \');
        Print(pTemp^.right, tabs + 4);
      end;
  end;

  procedure Pop(sKey: integer);
<<<<<<< HEAD
  var pRTemp, pLTemp:pSTreeNode;
    LR:integer;
=======
  var pRTemp, pLTemp, pCurrent:pSTreeNode;
    LR,nKey:integer;
>>>>>>> test
  begin
    if (Search(sKey) <> nil) then
    begin
      if (pTemp^.left = nil) and (pTemp^.right = nil) then
      begin //если вершина терминальная
        WriteLn;
        WriteLn('Вершина терминальная, удаляю.');
        WriteLn('Родителем является: ', pParent^.key);
        if pParent^.left = pTemp then
          pParent^.left := nil;
        if pParent^.right = pTemp then
          pParent^.right := nil;
        WriteLn('Успешно удалено.');
        WriteLn;
      end //если у вершины есть хотя бы один потомок
      else if (pTemp^.left = nil) xor (pTemp^.right = nil) then
      begin
        WriteLn;
        WriteLn('У вершины есть один потомок, удаляю безопасным методом.');
        WriteLn('Родителем является: ', pParent^.key);
        if (pTemp^.left = nil) then
        begin
          pParent^.right := pTemp^.right;
          pTemp^.right := nil;
        end;
        if (pTemp^.right = nil) then
        begin
          pParent^.left := pTemp^.left;
          pTemp^.left := nil;
        end;
        WriteLn('Успешно удалено.');
        WriteLn;
      end
      else if (pParent^.left <> nil) and (pParent^.right <> nil) then
      begin //если у вершины есть оба потомка
        WriteLn;
        WriteLn('У вершины есть два потомка: удаляю методом замены.');
        WriteLn('Левое поддерево: ',pTemp^.left);
        WriteLn('Правое поддерево: ',pTemp^.right);
        WriteLn('Родителем является: ', pParent^.key);

        //ищем самую левую вершину
        //заходим в левое поддерево и спускаемся как можно ниже по правой стороне
        pLTemp:=pTemp^.left;
        while (pLTemp^.right <> nil) do begin
        if (pLTemp^.right = nil) then break
        else pLTemp:=pLTemp^.right;
        end;
        WriteLn('Самая правая вершина в левом поддереве: ', pLTemp^.key);

        //ищем самую правую вершину
        //заходим в правое поддерево и спускаемся как можно ниже по левой стороне
        pRTemp:=pTemp^.right;
        while (pRTemp^.left <> nil) do begin
        if (pRTemp^.left = nil) then break
        else pRTemp:=pRTemp^.right;
        end;
        WriteLn('Самая левая вершина в правом поддереве: ', pRTemp^.key);

        //выбор вершины для замены
        Write('Какую вершину желаете выбрать в качестве замены? (Л/П): ');
        ReadLn(LR);
        if (LR = pRTemp^.key) then
        begin

          WriteLn('Удаляемая вершина - ',pTemp^.key);
          pCurrent:=pTemp;

          WriteLn('Выбрана вершина-заменитель - ',pRTemp^.key);
          nKey:=pRTemp^.key;
          pCurrent^.key:=nKey;
          WriteLn('Новый ключ применён.');
          WriteLn('Удаляю вершину-заменитель...');
          Pop(pRTemp^.key);

        end;
        if (LR = pLTemp^.key) then
        begin

          WriteLn('Удаляемая вершина - ',pTemp^.key);
          pCurrent:=pTemp;

          WriteLn('Выбрана вершина-заменитель - ',pLTemp^.key);
          nKey:=pLTemp^.key;
          pCurrent^.key:=nKey;
          WriteLn('Новый ключ применён.');
          WriteLn('Удаляю вершину-заменитель...');
          Pop(pLTemp^.key);
        end
        else //try again

      end;
    end
    else
    begin
      WriteLn;
      WriteLn('404: Вершина не найдена.');
    end;
    WriteLn;
  end;

begin
  repeat
    WriteLn('1. Поиск вершины с заданным значением ключа');
    WriteLn('2. Добавление новой вершины');
    WriteLn('3. Нарисовать дерево в консоли');
    WriteLn('4. Удаление вершины с заданным значением ключа');
    WriteLn('5. Выход из программы');
    Write('Введите значение: ');
    ReadLn(menu);
    case menu of
      1:
      begin
        WriteLn;
        Write('Введите значение ключа для поиска: ');
        ReadLn(sKey);
        pResult := Search(sKey);
        WriteLn(pResult^.key);
      end;
      2:
      begin
        Write('Введите ключ добавляемого элемента: ');
        ReadLn(NewKey);
        AddNode(pRoot, NewKey);
        WriteLn('Успешно добавлено.');
        WriteLn;
      end;
      3: Print(pRoot, 0);
      4:
      begin
        Write('Введите ключ вершины для удаления: ');
        ReadLn(sKey);
        Pop(sKey);
      end;
    end;
  until menu = 5;
end.