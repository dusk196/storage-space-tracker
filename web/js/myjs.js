/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */


function formValidation()
{
    var fnm = document.registration.fnm;
    var lnm = document.registration.lnm;
    var adr = document.registration.adr;
    var phn = document.registration.phn;


    if (alphanumeric(fnm))
    {
        if (alphanumeric(lnm))
        {
            if (alphanumeric(adr))
            {
                if (alphanumeric(phn))
                {
                    alert('Form is submitted successfully... Thank you...');
                    window.location.reload();
                }
            }
        }
    }
    return false;
}

function allLetter(fnm)
{
    var letters = /^[A-Za-z]+$/;
    if (fnm.value.match(letters))
    {
        return true;
    } else
    {
        alert('Name must have alphabet characters only (i.e A-Z & a-z)');
        fnm.focus();
        return false;
    }
}

function allLetter(lnm)
{
    var letters = /^[A-Za-z]+$/;
    if (lnm.value.match(letters))
    {
        return true;
    } else
    {
        alert('Name must have alphabet characters only (i.e A-Z & a-z)');
        lnm.focus();
        return false;
    }
}

function alphanumeric(adr)
{
    var letters = /^[0-9a-zA-Z]+$/;
    if (adr.value.match(letters))
    {
        return true;
    } else
    {
        alert('Address must have alphanumeric characters only... Please try again...');
        adr.focus();
        return false;
    }
}

function allnumeric(phn)
{
    var numbers = /^[0-9]+$/;
    if (phn.value.match(numbers))
    {
        return true;
    } else
    {
        alert('ZIP code must have numeric values... Please try again...');
        phn.focus();
        return false;
    }
}