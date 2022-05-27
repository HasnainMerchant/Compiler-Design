import re
import os

delimiter = {'{':'1', '}':'2', '(':'3', ')':'4',
             ';':'5', '/':'6', '"':'7', '|':'8', ',':'9','[':'10',']':'11'}

operator = {'=':'1', '<':'2', '>':'3', '==':'4', '<=':'5', '>=':'6','+':'7','*':'8','-':'9'}

keyword = {'abstract':'1', 'continue':'2', 'for':'3', 'new':'4', 'switch':'5',
           'default':'6', 'package':'7', 'synchronized':'8', 'boolean':'9', 'do':'10',
           'if':'11', 'private':'12', 'this':'13','break':'14', 'double':'15',
            'implements':'16', 'protected':'17', 'throw':'18', 'byte':'19',    'else':'20',
            'import':'21', 'public':'22', 'throws':'23', 'case':'24', 'instanceof':'25',
            'return':'26', 'transient':'27', 'catch':'28', 'extends':'29', 'int':'30',
           'short':'31', 'try':'32', 'char':'33', 'final':'34',    'interface':'35',
           'static':'36', 'void':'37', 'class':'38', 'finally':'39', 'long':'40',
           'volatile':'41',    'float':'42', 'native':'43', 'super':'44', 'while':'45',
           'String':'46'}

#Input C Program
input = open("input.java","r")

#Token Output
token = open("output.txt",'a+')
token.truncate(0)
token.write("#LineNo\t\t#Lexeme\t\t#Token\t\t#Token Value\n")

#Symbol Table
sym = open("SYMTAB.txt",'a+')
sym.truncate(0)

symtab = {}

pattern = re.compile(r"[A-Za-z]+")
errorPattern = re.compile((r"[0-9]+[A-Za-z]+"))
numberPattern = re.compile(r"[0-9]+")

lineNo = 0
id = 0

for lines in input:
    lineNo = lineNo + 1
    words = lines.split()
    for i in range(len(words)):
        token.write(str(lineNo) + '\t\t\t')
        if words[i] in keyword:
            num = keyword[words[i]]
            token.write(words[i] + '\t\t' + 'Keyword' + '\t\t' + '(KD,' + num + ')' + '\n')

        if words[i] in delimiter:
            num = delimiter[words[i]]
            token.write(words[i] + '\t\t' + 'Delimiter' + '\t\t' + '(D,' + num + ')' + '\n')

        if re.fullmatch(pattern, words[i]) and not words[i] in keyword:
            id += 1
            token.write(words[i] + '\t\t' + 'Identifier' + '\t\t' + '(ID,' + str(id) + ')' + '\n')

            if words[i] not in symtab:
                symtab[words[i]] = id
                sym.write(str(id) + '\t' + words[i] + '\n')

        if re.fullmatch(errorPattern, words[i]) and not words[i] in keyword:
            token.write("\n")
            print("Cannot Declare Varaible Starting With Numbers " + words[i])


        if re.fullmatch(numberPattern, words[i]):
            token.write(words[i] + '\t\t' + 'Constant' + '\t\t' + '(C,' + words[i] + ')' + '\n')

        if words[i] in operator:
            num = operator[words[i]]
            token.write(words[i] + '\t\t' + 'Operator' + '\t\t' + '(O,' + num + ')' + '\n')