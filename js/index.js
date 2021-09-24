//expresiions for getting the replace value
let reg = /^B.../i //should start with this
let reg2 = /{/i //should have this in between
let reg3 = /}/i //should have this at the end
let reg7 = /};$/
let reg8 = /BYTE............{/g

//expressions for getting the offsets
let reg4 = /^VALUESINJECT\(/i //should start with this
let reg5 = /0x/g //should have this one time
let reg6 = /libue4header/g // should have this too

let upload = document.getElementById('file')
let outputBx = document.getElementById('outputBx')
var decodedString = ""
upload.addEventListener('change',()=>{
    let fr = new FileReader()
    fr.readAsText(upload.files[0])
    fr.onload=function (e) {
       /* let text=fr.result
       
        decodedString =String(text).replace(/;/g,'<br>')
        outputBx.innerHTML=decodedString*/
        const fl = e.target.result
        const alllines=fl.split(/\r\n|\n/);
      

            alllines.forEach((line) => {
               // console.log(line);
                if(reg.test(line)){

                    let remove0x = line.replace(/0x/g,'').replace(/,/g,'').replace(reg7,'')
                    if(reg8.test(remove0x)){
                        console.log(remove0x.replace(reg8,''))
                        return
                    }else{
                        return
                    }
                    console.log(remove0x)

                }
                if(reg4.test(line)){
                    console.log(line.replace(reg4,'').replace(reg6,'').replace(/\);/g,'').replace(/, ....... .............., /g,''))
                }
               
    
            });
      


        
}



})

function find(string) {

    //get the string from a uploaded file line by line 
    var mystring = string
    if(mystring!=""){

 

   // console.log(mystring)

 


    if(reg.test(mystring) && reg2.test(mystring)){
        let result = reg.exec(mystring)
        console.log('Getting the replace value for ='+result)
        if(result=="BYTE"){

            let start=reg2.exec(mystring)
            let startIndex = Number(start.index)
            console.log('THE START INDEX OF STRING IS ',startIndex) 
            let ends = reg3.exec(mystring)
            let endsIndex=Number(ends.index)
            console.log('THE ENDS INDEX OF STRING IS ',endsIndex)

            let filterString =""

            //now we have to red the line fron startIndex to endIndex
            for (let index = startIndex+1; index < endsIndex; index++) {
                    filterString+= mystring[index]
                    
            }
            console.log('from startIndex to endsIndex line is ',filterString)
        let removed0x = filterString.replace(/0x/g,'').replace(/,/g,'') //removing commas and 0x
        console.log('the replace value is',String(removed0x))
        


            
        }
    } else{
        let result = reg4.exec(mystring)
        console.log('Getting the offsets for ',result)
        if(result=="VALUES"){
        let offset = reg5.exec(mystring) //getting the index of offsets located in the string
        //let oxindex= Number(offset.index)
        
        console.log('The Index of offset is ',offset.index)
        let comma = reg6.exec(mystring) //getting the first index of comma
       
        console.log('The index of comma is ',Number(comma.index))

        //now we have to capture the text starting from offset.index to comma .index
        var filterstring=""
       
        for (let index = offset.index; index < comma.index; index++) {
                
                filterstring+=mystring[index]
            
        }
        console.log('The offset is ',filterstring)
        }
    }

   
    
    
}
    
}




