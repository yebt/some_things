
def load_file():
    #load file
    txt= open('db.txt','r').read()  
    #split
    lines = txt.split('\n')
    # the first line have the class name
    classname = (lines[0].split('['))[0].split(' ')[2]
    # 
    atribs = []
    types = []
    # load the types and the attribs
    for lns in lines[1:]:
        wrds = lns.split(' ')
        contin=0
        for wrd in wrds:
            if len(wrd) != 0:
                if contin ==0:
                    atribs.append(wrd)
                    contin=1
                elif contin == 1:
                    types.append(wrd)
                    break

    # equal the lists
    if (len(atribs) > len(types)):
        atribs.pop()

    # parse to java types
    type_by_java = {
            "VARCHAR":"String",
            "TEXT": "String",
            "INTEGER": "int",
            "NUMBER": "double",
            "DATE":"Date",
    }
    type_by_java_S ={
            "VARCHAR":"String",
            "TEXT": "String",
            "INTEGER": "Int",
            "NUMBER": "Double",
            "DATE":"Date",
            }
    # generate the uper case and s
    classnameUse = classname.capitalize()  

    # generate the cahnge by varchar
    for indx,typ in zip(range(len(types)),types):
        if 'VARCHAR' in typ:
            types[indx] = 'VARCHAR'
        types[indx] = type_by_java[types[indx]]
        


    ## now generate the obj string
    obj_string = "package objs;\n"
    obj_string += \
"import java.util.ArrayList; \n\
"
    obj_string += "/*" + txt + "*/\n" + \
f'public class {classnameUse} ' + '{  \n' 
    
    for indx,camp in zip(range(len(types)),types):
        obj_string += "\tprivate "+types[indx] + " " + atribs[indx] + ";\n"

    obj_string += "\n\t/* constructor*/\n\tpublic " + classnameUse + "("
    
    for indx,camp in zip(range(len(types)),types):
        obj_string += types[indx] + " " + atribs[indx] 
        if indx < len(types)-1:
            obj_string += ', '
        else :
            obj_string += " ){ \n"

    for indx,camp in zip(range(len(types)),types):
        obj_string += "\t\tthis." + atribs[indx] + " = " + atribs[indx] + ";\n"

    obj_string += "\t}\n"

    # getters and stters 

    obj_string += "\n\t/* GETTERS AND SETTERS */\n" 
    for indx,camp in zip(range(len(types)),types):
        obj_string += "\n\tpublic " + types[indx] + " get" + atribs[indx].capitalize() + "(){\n" + "\t\treturn " + atribs[indx] + ";\n\t}\n"
        obj_string += "\n\tpublic void set" + atribs[indx].capitalize() + "(" + types[indx] + " " +  atribs[indx]+" ){\n\t\tthis."+ atribs[indx] + " = " + atribs[indx] + ";\n\t}\n"

    # print
    obj_string += "\n\t@Override\n\tpublic String toString(){\n\t\treturn "
    obj_string += "\"" + classnameUse + " [\"+"
    for indx,camp in zip(range(len(types)),types):
        obj_string += "\"" + atribs[indx] + "= \"+ " + atribs[indx]  + " + "
        if indx == len(types)-1:
            obj_string += ' \"]\";'
    obj_string += "\n\t}\n"

    # print array 
    obj_string += "\n\tpublic static void print( ArrayList<" + classnameUse + "> obj ){\n\t\t"
    obj_string += "for (int i = 0; i < obj.size(); i++) {\n\t\t\t"
    obj_string += "System.out.println(obj.get(i).toString());"
    obj_string += "\n\t\t}\n\t}\n}\n"



    ################ wrk on the dao project 

    dao_string ="package dao;\nimport java.sql.Connection;\n\
import java.sql.PreparedStatement;\n\
import java.sql.ResultSet;\n\
import java.util.ArrayList;\n"
    ## supose the packet is objts
    dao_string += "\nimport objs."+classnameUse+";\n\n"
    dao_string += "public class " + classnameUse +"DAO {\n"
    dao_string += "\t// CRUD\n\n"
    dao_string += "\t/*CREATE*/\n"
    dao_string += "\tpublic static void create(" + classnameUse+" obj){\n"
    dao_string += "\t\tConnection conn = null;\n"
    dao_string += "\t\ttry {\n"
    dao_string += "\t\t\t//get connection\n"
    dao_string += "\t\t\tconn = AdminDAO.getConnection();\n"
    dao_string += "\t\t\tPreparedStatement prest = conn.prepareStatement(\n"
    dao_string += "\t\t\t\t \"INSERT INTO " + classname + " ("
    for indx,itm in zip(range(len(types)),types):
        dao_string += atribs[indx] 
        if indx < len(types)-1:
            dao_string += ", "
        else:
            dao_string += ") "
    dao_string += "VALUES ("
    for indx,itm in zip(range(len(types)),types):
        dao_string += "?"
        if indx < len(types)-1:
            dao_string += ", "
        else:
            dao_string += ") \");"

    for indx,itm in zip(range(len(types)),types):
        dao_string += "\n\t\t\tprest.set"+ types[indx].capitalize() + "(" + str(indx +1) + ", " + "obj.get" + atribs[indx].capitalize() + "());"

    dao_string += "\n\n\t\t\tif(prest.executeUpdate() > 0) {\n"
    dao_string += "\t\t\t\tSystem.out.println(\"" + classname + " register successfully\");"
    dao_string += "\t\t\t}\n"
    dao_string += "\t\t} catch (Exception e) {\n"
    dao_string += "\t\t\tSystem.out.println(\"error to try register " + classname+"\");\n"
    dao_string += "\t\t\te.printStackTrace();\n\t\t}\n\t}\n"

    dao_string += "\n\t/*read select*/\n"
    dao_string += "\tpublic static ArrayList<"+classnameUse+"> read(String queryopption){\n"
    dao_string += "\t\tArrayList<"+classnameUse+"> allobjts=null;\n\t\tConnection conn = null;\n"
    dao_string += "\t\ttry {\n\t\t\t//get Connection\n"
    dao_string += "\t\t\tconn = AdminDAO.getConnection();\n\t\t\t//put sql\n\t\t\tResultSet rs =null;\n\t\t\tif(queryopption.equals(\"\")) {\n"
    dao_string += "\t\t\t\trs = conn.createStatement().executeQuery(\"select * from "+classname+" \" );\n"
    dao_string += "\t\t\t}else {\n\t\t\t\trs = conn.createStatement().executeQuery(queryopption);\n\t\t\t}\n\n"
    dao_string += "\t\t\tallobjts= new ArrayList<"+classnameUse+">();\n"
    dao_string += "\t\t\twhile (rs.next()) {\n"
    dao_string += "\t\t\t\tallobjts.add( new " + classnameUse + "(" 

    for indx,itm in zip(range(len(types)),types):
        dao_string += "rs.get" + types[indx].capitalize() + "("+str(indx +1)+")"
        if indx < len(types)-1:
            dao_string += ", "
        else:
            dao_string += "));\n"

    dao_string += "\t\t\t}\n"
    dao_string += "\t\t} catch (Exception e) {\n\t\t\tSystem.out.println(\"error to select into "+classname+" \" + e);\n"
    dao_string += "\t\t\te.printStackTrace();\n\t\t}\n\t\treturn allobjts;\n\t}\n"

    dao_string += "\n\t/*UPDATE*/\n"
    dao_string += "\tpublic static int update("+classnameUse+" obj){\n\t\tConnection conn = null;\n\t\tint registro =0;\n\t\ttry {\n\t\t\tconn = AdminDAO.getConnection();\n"

    dao_string += "\t\t\tPreparedStatement prepatest = conn.prepareStatement(\"UPDATE " + classname + " SET "
    
    for indx,itm in zip(range(len(types[1:])),types[1:]):

        dao_string += atribs[indx+1] + "=?"
        if indx < len(types)-2:
            dao_string += ", "
        else:
            dao_string += " WHERE " + atribs[0] + "=?\");\n"

    for indx,itm in zip(range(len(types)),types):
        dao_string += "\t\t\tprepatest.set" + types[indx].capitalize() + "(" + str(indx + 1) + ",obj.get" + atribs[indx].capitalize() + "());\n"

    dao_string += "\t\t\tregistro = prepatest.executeUpdate();\n"
    dao_string += "\t\t\tif(registro > 0) {\n\t\t\t\tSystem.out.println(\" "+ classname+ " update successfully\");\n"
    dao_string += "\t\t\t}\n\t\t} catch (Exception e) {\n\t\t\tSystem.out.println(\"error to update "+classname+"\" + e);\n"
    dao_string += "\t\t\te.printStackTrace();\n\t\t}\n\t\treturn registro;\n\t}\n"
    dao_string += "\n\n\t/*DELETE*/\n"
    dao_string += "\tpublic static int delete("+classnameUse+" obj){\n"
    dao_string += "\t\tConnection conn = null;\n\t\tint re=0;\n\t\ttry {\n"
    dao_string += "\t\t\tconn = AdminDAO.getConnection();\n"
    dao_string += "\t\t\tResultSet rs = conn.createStatement().executeQuery(\"DELETE FROM "+classname+" WHERE "+atribs[0]+"=\'\" + obj.get"+atribs[0].capitalize()+"()+ \"\'\" );\n"
    dao_string += "\t\t\tif (rs.next())\n"
    dao_string += "\t\t\t\tre = 1;\n\n"
    dao_string += "\t\t} catch (Exception e) {\n\t\t\tSystem.out.println(\"erroe to delete "+classname+" \" + e);\n"
    dao_string += "\t\t\te.printStackTrace();\n"
    dao_string += "\t\t}\n\n\t\treturn re;\n\t}\n}\n"


    """
    print(dao_string)
    print("__________________________________________________")

    print(classname)
    print(atribs)
    print(types)
    """

    # saved the files
    obj_outpt_file= open(classnameUse+".java", "w")
    dao_outpt_file= open(classnameUse+"DAO.java", "w")
    obj_outpt_file.write(obj_string)
    dao_outpt_file.write(dao_string)
    obj_outpt_file.close()
    dao_outpt_file.close()

def main():
    load_file()


if __name__ == '__main__':
    main()

