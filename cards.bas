'Copyright 2021 Richard D. Clark

'Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"),
'to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense,
'and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

'The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

'THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
'FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
'LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS
'IN THE SOFTWARE.
'========================================================================================================================================================
Option _Explicit
Randomize Timer
Const false = 0
Const true = Not false
'Card width and height.
Const cardwidth = 71
Const cardheight = 96
'Card placeholder.
Const cplacegreen = 1
Const cplacered = 2
'Card backs.
Const cbackred = 1
Const cbackblue = 2
Const cbackpink = 3
'Card ids.
Const cClubAce = 1
Const cClubTwo = 2
Const cClubThree = 3
Const cClubFour = 4
Const cClubFive = 5
Const cClubSix = 6
Const cClubSeven = 7
Const cClubEight = 8
Const cClubNine = 9
Const cClubTen = 10
Const cClubJack = 11
Const cClubQueen = 12
Const cClubKing = 13
Const cDiamAce = 14
Const cDiamTwo = 15
Const cDiamThree = 16
Const cDiamFour = 17
Const cDiamFive = 18
Const cDiamSix = 19
Const cDiamSeven = 20
Const cDiamEight = 21
Const cDiamNine = 22
Const cDiamTen = 23
Const cDiamJack = 24
Const cDiamQueen = 25
Const cDiamKing = 26
Const cHearAce = 27
Const cHearTwo = 28
Const cHearThree = 29
Const cHearFour = 30
Const cHearFive = 31
Const cHearSix = 32
Const cHearSeven = 33
Const cHearEight = 34
Const cHearNine = 35
Const cHearTen = 36
Const cHearJack = 37
Const cHearQueen = 38
Const cHearKing = 39
Const cSpadAce = 40
Const cSpadTwo = 41
Const cSpadThree = 42
Const cSpadFour = 43
Const cSpadFive = 44
Const cSpadSix = 45
Const cSpadSeven = 46
Const cSpadEight = 47
Const cSpadNine = 48
Const cSpadTen = 49
Const cSpadJack = 50
Const cSpadQueen = 51
Const cSpadKing = 52
Const cJokerBlack = 53
Const cJokerRed = 54
'Card suits.
Const sClub = 1
Const sDiamond = 2
Const sHeart = 3
Const sSpade = 4
Const sJokerBlack = 5
Const sJokerRed = 6
'Card face.
Const fAce = 1
Const fTwo = 2
Const fThree = 3
Const fFour = 4
Const fFive = 5
Const fSix = 6
Const fSeven = 7
Const fEight = 8
Const fNine = 9
Const fTen = 10
Const fJack = 11
Const fQueen = 12
Const fKing = 13
Const fJoker = 14

'Card object.
Type cardobj
    cardid As Integer
    cardback As Integer
    cardrank As Integer
    cardsuit As Integer
    cardface As Integer
    cardvalue As Integer
    faceofcard As String
    suitofcard As String
End Type

Dim deck(cClubAce To cJokerRed) As cardobj
Dim chandle As Long
Dim As Integer ret, i, cd, x, y, tx, ty

Screen _NewImage(cardwidth * 11, cardheight * 5, 32)
Cls , _RGB(0, 128, 0)
_Title "Playing Card Demo"
'Load the card graphic.
ret = LoadCardBmp%("cards.bmp", chandle)
If ret = true Then
    InitDeck deck(), cbackred
    'Print out all the cards in a shuffled deck.
    For i = LBound(deck) To UBound(deck)
        DrawCardFront x, y, deck(i).cardid, chandle
        x = x + cardwidth
        If x + cardwidth > _Width(0) Then
            x = 0
            y = y + cardheight
        End If
    Next
    Sleep
    Cls , _RGB(0, 128, 0)
    x = 0
    y = 0
    'Reshufflee the deck and print again.
    Shuffle deck()
    For i = LBound(deck) To UBound(deck)
        DrawCardFront x, y, deck(i).cardid, chandle
        x = x + cardwidth
        If x + cardwidth > _Width(0) Then
            x = 0
            y = y + cardheight
        End If
    Next
    Sleep
    Cls , _RGB(0, 128, 0)
    x = _Width(0) / 2 - cardwidth
    y = _Height(0) / 2 - cardheight
    DrawPlaceholder x, y, cplacered, chandle
    x = x + cardwidth + 1
    DrawPlaceholder x, y, cplacegreen, chandle
    Sleep
    Cls , _RGB(0, 128, 0)

    'Print card information
    tx = 25
    For i = 1 To 5
        x = _Width(0) / 2 - cardwidth
        y = _Height(0) / 2 - cardheight
        cd = Rand(LBound(deck), UBound(deck))
        DrawCardFront x, y, deck(cd).cardid, chandle
        x = x + cardwidth + 1
        DrawCardBack x, y, deck(cd).cardback, chandle
        ty = 10
        Locate ty, tx
        Print "Card id:" + Str$(deck(cd).cardid)
        ty = ty + 1
        Locate ty, tx
        Print "Card back:" + Str$(deck(cd).cardback)
        ty = ty + 1
        Locate ty, tx
        Print "Card rank:" + Str$(deck(cd).cardrank)
        ty = ty + 1
        Locate ty, tx
        Print "Card suit:" + Str$(deck(cd).cardsuit)
        ty = ty + 1
        Locate ty, tx
        Print "Card face:" + Str$(deck(cd).cardface)
        ty = ty + 1
        Locate ty, tx
        Print "Card value:" + Str$(deck(cd).cardvalue)
        ty = ty + 1
        Locate ty, tx
        Print "Card face: " + deck(cd).faceofcard
        ty = ty + 1
        Locate ty, tx
        Print "Card suit: " + deck(cd).suitofcard
        Sleep
        Cls , _RGB(0, 128, 0)
    Next
End If

'Free the bmp and exit.

_FreeImage chandle
End


'Initialze the deck.
Sub InitDeck (cdeck() As cardobj, cback As Integer)
    Dim As Integer i
    For i = cClubAce To cJokerRed
        cdeck(i).cardid = i
        cdeck(i).cardback = cback
        cdeck(i).cardrank = cRank%(i)
        cdeck(i).cardsuit = cSuit%(i)
        cdeck(i).cardface = cFace%(i)
        cdeck(i).cardvalue = i
        cdeck(i).faceofcard = FaceString$(cdeck(i).cardface)
        cdeck(i).suitofcard = SuitString$(cdeck(i).cardsuit)
    Next
End Sub

'Returns the rank of the card.
Function cRank% (cid As Integer)
    Dim ret As Integer

    Select Case cid
        Case cClubAce, cDiamAce, cHearAce, cSpadAce
            ret = 1
        Case cClubTwo, cDiamTwo, cHearTwo, cSpadTwo
            ret = 2
        Case cClubThree, cDiamThree, cHearThree, cSpadThree
            ret = 3
        Case cClubFour, cDiamFour, cHearFour, cSpadFour
            ret = 4
        Case cClubFive, cDiamFive, cHearFive, cSpadFive
            ret = 5
        Case cClubSix, cDiamSix, cHearSix, cSpadSix
            ret = 6
        Case cClubSeven, cDiamSeven, cHearSeven, cSpadSeven
            ret = 7
        Case cClubEight, cDiamEight, cHearEight, cSpadEight
            ret = 8
        Case cClubNine, cDiamNine, cHearNine, cSpadNine
            ret = 9
        Case cClubTen, cDiamTen, cHearTen, cSpadTen
            ret = 10
        Case cClubJack, cDiamJack, cHearJack, cSpadJack
            ret = 11
        Case cClubQueen, cDiamQueen, cHearQueen, cSpadQueen
            ret = 12
        Case cClubKing, cDiamKing, cHearKing, cSpadKing
            ret = 13
        Case cJokerBlack, cJokerRed
            ret = 14
    End Select
    cRank% = ret
End Function

'Returns the suit id of tghe card.
Function cSuit% (cid As Integer)
    Dim ret As Integer

    Select Case cid
        Case cClubAce TO cClubKing
            ret = sClub
        Case cDiamAce TO cDiamKing
            ret = sDiamond
        Case cHearAce TO cHearKing
            ret = sHeart
        Case cSpadAce TO cSpadKing
            ret = sSpade
        Case cJokerRed
            ret = sJokerRed
        Case cJokerBlack
            ret = sJokerBlack
    End Select

    cSuit% = ret

End Function
'Returns the face id of the card.
Function cFace% (cid As Integer)
    Dim ret As Integer

    Select Case cid
        Case cClubAce, cDiamAce, cHearAce, cSpadAce
            ret = fAce
        Case cClubTwo, cDiamTwo, cHearTwo, cSpadTwo
            ret = fTwo
        Case cClubThree, cDiamThree, cHearThree, cSpadThree
            ret = fThree
        Case cClubFour, cDiamFour, cHearFour, cSpadFour
            ret = fFour
        Case cClubFive, cDiamFive, cHearFive, cSpadFive
            ret = fFive
        Case cClubSix, cDiamSix, cHearSix, cSpadSix
            ret = fSix
        Case cClubSeven, cDiamSeven, cHearSeven, cSpadSeven
            ret = fSeven
        Case cClubEight, cDiamEight, cHearEight, cSpadEight
            ret = fEight
        Case cClubNine, cDiamNine, cHearNine, cSpadNine
            ret = fNine
        Case cClubTen, cDiamTen, cHearTen, cSpadTen
            ret = fTen
        Case cClubJack, cDiamJack, cHearJack, cSpadJack
            ret = fJack
        Case cClubQueen, cDiamQueen, cHearQueen, cSpadQueen
            ret = fQueen
        Case cClubKing, cDiamKing, cHearKing, cSpadKing
            ret = fKing
        Case cJokerBlack, cJokerRed
            ret = fJoker
    End Select

    cFace% = ret
End Function

'Returns the face of the card as a string.
Function FaceString$ (cf As Integer)
    Dim ret As String

    Select Case cf
        Case fAce
            ret = "Ace"
        Case fTwo
            ret = "Two"
        Case fThree
            ret = "Three"
        Case fFour
            ret = "Four"
        Case fFive
            ret = "Five"
        Case fSix
            ret = "Six"
        Case fSeven
            ret = "Seven"
        Case fEight
            ret = "Eight"
        Case fNine
            ret = "Nine"
        Case fTen
            ret = "Ten"
        Case fJack
            ret = "Jack"
        Case fQueen
            ret = "Queen"
        Case fKing
            ret = "King"
        Case fJoker
            ret = "Joker"
    End Select

    FaceString$ = ret
End Function

'Returns the suit of the card as a string.
Function SuitString$ (cs As Integer)
    Dim ret As String

    Select Case cs
        Case sClub
            ret = "Club"
        Case sDiamond
            ret = "Diamond"
        Case sHeart
            ret = "Heart"
        Case sSpade
            ret = "Spade"
        Case sJokerBlack
            ret = "Black Joker"
        Case sJokerRed
            ret = "Red Joker"
    End Select

    SuitString$ = ret
End Function

'Returns a reandom integer between low and high.
'get a random number between low and high
Function Rand% (lb As Integer, ub As Integer)
    Rand% = Int(Rnd * (ub - lb + 1)) + lb
End Function


'Shuffle cards using Fisher-Yates algorithm.
Sub Shuffle (cdeck() As cardobj)
    Dim As Integer dlow, dhigh, idx, i

    'Shuffle deck.
    dlow = LBound(cdeck)
    dhigh = UBound(cdeck)
    For i = dhigh To dlow Step -1
        idx = Rand%(dlow, i)
        Swap cdeck(idx).cardid, cdeck(i).cardid
        Swap cdeck(idx).cardback, cdeck(i).cardback
        Swap cdeck(idx).cardrank, cdeck(i).cardrank
        Swap cdeck(idx).cardsuit, cdeck(i).cardsuit
        Swap cdeck(idx).cardface, cdeck(i).cardface
        Swap cdeck(idx).cardvalue, cdeck(i).cardvalue
        Swap cdeck(idx).faceofcard, cdeck(i).faceofcard
        Swap cdeck(idx).suitofcard, cdeck(i).suitofcard
    Next

End Sub

'Loads the card image.
Function LoadCardBmp% (bmpname As String, handle As Long)
    handle = _LoadImage(bmpname, 32)
    If handle > -2 Then
        LoadCardBmp% = false
    Else
        LoadCardBmp% = true
    End If
End Function

'Draws a card front based on its id.
Sub DrawCardFront (x As Integer, y As Integer, cid As Integer, chandle As Integer)
    Dim As Integer x1, y1, x2, y2

    'Check the x, y.
    If x >= 0 And x <= _Width(0) Then
        If y >= 0 And y <= _Height(0) Then
            Select Case cid
                Case cClubAce
                    x1 = cardwidth * 0: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cClubTwo
                    x1 = cardwidth * 1: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cClubThree
                    x1 = cardwidth * 2: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cClubFour
                    x1 = cardwidth * 3: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cClubFive
                    x1 = cardwidth * 4: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cClubSix
                    x1 = cardwidth * 5: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cClubSeven
                    x1 = cardwidth * 6: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cClubEight
                    x1 = cardwidth * 7: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cClubNine
                    x1 = cardwidth * 8: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cClubTen
                    x1 = cardwidth * 9: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cClubJack
                    x1 = cardwidth * 10: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cClubQueen
                    x1 = cardwidth * 11: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cClubKing
                    x1 = cardwidth * 12: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 0: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamAce
                    x1 = cardwidth * 0: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamTwo
                    x1 = cardwidth * 1: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamThree
                    x1 = cardwidth * 2: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamFour
                    x1 = cardwidth * 3: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamFive
                    x1 = cardwidth * 4: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamSix
                    x1 = cardwidth * 5: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamSeven
                    x1 = cardwidth * 6: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamEight
                    x1 = cardwidth * 7: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamNine
                    x1 = cardwidth * 8: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamTen
                    x1 = cardwidth * 9: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamJack
                    x1 = cardwidth * 10: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamQueen
                    x1 = cardwidth * 11: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cDiamKing
                    x1 = cardwidth * 12: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 1: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearAce
                    x1 = cardwidth * 0: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearTwo
                    x1 = cardwidth * 1: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearThree
                    x1 = cardwidth * 2: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearFour
                    x1 = cardwidth * 3: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearFive
                    x1 = cardwidth * 4: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearSix
                    x1 = cardwidth * 5: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearSeven
                    x1 = cardwidth * 6: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearEight
                    x1 = cardwidth * 7: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearNine
                    x1 = cardwidth * 8: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearTen
                    x1 = cardwidth * 9: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearJack
                    x1 = cardwidth * 10: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearQueen
                    x1 = cardwidth * 11: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cHearKing
                    x1 = cardwidth * 12: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 2: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadAce
                    x1 = cardwidth * 0: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadTwo
                    x1 = cardwidth * 1: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadThree
                    x1 = cardwidth * 2: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadFour
                    x1 = cardwidth * 3: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadFive
                    x1 = cardwidth * 4: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadSix
                    x1 = cardwidth * 5: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadSeven
                    x1 = cardwidth * 6: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadEight
                    x1 = cardwidth * 7: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadNine
                    x1 = cardwidth * 8: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadTen
                    x1 = cardwidth * 9: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadJack
                    x1 = cardwidth * 10: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadQueen
                    x1 = cardwidth * 11: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cSpadKing
                    x1 = cardwidth * 12: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 3: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cJokerRed
                    x1 = cardwidth * 0: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 4: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cJokerBlack
                    x1 = cardwidth * 1: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 4: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
            End Select
        End If
    End If
End Sub

'Draws a card front based on its id.
Sub DrawCardBack (x As Integer, y As Integer, cb As Integer, chandle As Integer)
    Dim As Integer x1, y1, x2, y2

    'Check the x, y.
    If x >= 0 And x <= _Width(0) Then
        If y >= 0 And y <= _Height(0) Then
            Select Case cb
                Case cbackred
                    x1 = cardwidth * 2: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 4: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cbackblue
                    x1 = cardwidth * 3: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 4: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cbackpink
                    x1 = cardwidth * 4: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 4: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
            End Select
        End If
    End If
End Sub

'Draws a graphic placeholder.
Sub DrawPlaceholder (x As Integer, y As Integer, pl As Integer, chandle As Long)
    Dim As Integer x1, y1, x2, y2

    If x >= 0 And x <= _Width(0) Then
        If y >= 0 And y <= _Height(0) Then
            Select Case pl
                Case cplacegreen
                    x1 = cardwidth * 5: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 4: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
                Case cplacered
                    x1 = cardwidth * 6: x2 = x1 + (cardwidth - 1)
                    y1 = cardheight * 4: y2 = y1 + (cardheight - 1)
                    _PutImage (x, y), chandle, 0, (x1, y1)-(x2, y2)
            End Select
        End If
    End If
End Sub

