from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions
from selenium.common.exceptions import NoSuchElementException

import time, math

class PageGetSet:
    def __init__(self):
        self.PET_OWNERS = 0
        self.INVENTORY = 1
        self.VETS = 2
        self.VETS_DETAILS = 3
        self.APPOINTMENTS = 4
        self.PET_OWNER_DETAILS = 5
        self.APPOINTMENT_DETAILS = 6

        self.Browser = None
        self.WorkElement = None

        self.Pages = [
            "PetOwners.aspx",
            "Inventory.aspx",
            "Vets.aspx",
            "VetDetails.aspx",
            "Appointments.aspx",
            "PetOwnerDetails.aspx",
            "AppointmentDetails.aspx"
        ]

        self.Statistics = {
            "success": 0,
            "fail": 0,
            "max": 0
        }

        self.CurrentPage = self.PET_OWNERS
        self.InitializeBrowser("http://localhost:50452/" + self.Pages[self.CurrentPage])
        self.RunCommands()

    def InitializeBrowser(self, address):
        self.Browser = webdriver.Firefox()
        self.Browser.get(address)

    def UpdateStatistics(self, status):
        self.Statistics[status] += 1
        self.Statistics["max"] += 1

    def GetElementById(self, id):
        try:
            self.WorkElement = self.Browser.find_element_by_id(id)
            return self.WorkElement
        except NoSuchElementException:
            return False

    def SendKeysToElement(self, element, keys):
        element.clear()
        element.send_keys(keys)

    def WaitForElementToExist(self, id):

        WebDriverWait(self.Browser, 3).until(
            expected_conditions.visibility_of_element_located(
                (By.ID, id)
            )
        )

    def SwitchToPage(self, pageID):
        self.CurrentPage = pageID
        self.Browser.get("http://localhost:50452/" + self.Pages[self.CurrentPage])

    def ClickElement(self, element):
        element.click()

    def ClickElementById(self, elementId):
        self.GetElementById(elementId).click()

    def Sleep(self, length):
        time.sleep(length)

    def IfExistById(self, id):
        try:
            value = self.GetElementById(id)
            if(value == False): return False
            return True
        except NoSuchElementException:
            print("NO PAGE")
            return False

    def PetOwners(self):
        print("Testing Pet Owners Start")
        self.SwitchToPage(self.PET_OWNERS)
        self.SendKeysToElement(self.GetElementById("txtSearch"), "Arnold")
        self.Browser.find_element_by_xpath("//input[@id='btnSearch']").click()
        print("Testing Pet Owners Finish")
        self.Sleep(3)

    def PetOwnersDetails(self):
        print("Testing Pet Owners Details Start")
        self.SwitchToPage(self.PET_OWNER_DETAILS)
        self.SendKeysToElement(self.GetElementById("txtFirstname"), "Arnold")
        self.SendKeysToElement(self.GetElementById("txtLastname"), "Schwarzenegger")
        self.SendKeysToElement(self.GetElementById("txtMobile"), "424-288-2000")
        self.SendKeysToElement(self.GetElementById("txtEmail"), "ArnyIsCool@Schwarzenegger.com")
        self.Browser.find_element_by_xpath("//input[@id='chkID']").click()
        self.Browser.find_element_by_xpath("//input[@id='btnSave']").click()
        alert = self.Browser.switch_to_alert()
        alert.accept()
        self.SendKeysToElement(self.GetElementById("txtPetName"), "Arnold")
        self.SendKeysToElement(self.GetElementById("txtPetDOB"), "02/01/2023")
        self.SendKeysToElement(self.GetElementById("txtPetType"), "Schwarzenegger")
        self.SendKeysToElement(self.GetElementById("txtPetBreed"), "Arnold")
        self.Browser.find_element_by_xpath("//input[@id='btnAddPet']").click()
        alert = self.Browser.switch_to_alert()
        alert.accept()
        print("Testing Pet Owners Details Finish")
        self.Sleep(3)

    def Inventory(self):
        print("Testing Inventory Start")
        self.SwitchToPage(self.INVENTORY)
        self.SendKeysToElement(self.GetElementById("txtName"), "Arnold")
        self.SendKeysToElement(self.GetElementById("txtQuantity"), "50")
        self.SendKeysToElement(self.GetElementById("txtCost"), "2.0")
        self.SendKeysToElement(self.GetElementById("txtPrice"), "2.0")
        self.Browser.find_element_by_xpath("//input[@id='btnSave']").click()
        alert = self.Browser.switch_to_alert()
        alert.accept()
        self.SendKeysToElement(self.GetElementById("txtSearch"), "Arnold")
        self.Browser.find_element_by_xpath("//input[@id='btnSearch']").click()
        print("Testing Inventory Finish")
        self.Sleep(3)

    def Vets(self):
        print("Testing Vets Start")
        self.SwitchToPage(self.VETS)
        self.SendKeysToElement(self.GetElementById("txtSearch"), "Arnold")
        self.Browser.find_element_by_xpath("//input[@id='btnSearch']").click()
        print("Testing Vets Finish")
        self.Sleep(3)

    def VetsDetails(self):
        print("Testing Vets Details Start")
        self.SwitchToPage(self.VETS_DETAILS)
        self.SendKeysToElement(self.GetElementById("txtFirstName"), "Arnold")
        self.SendKeysToElement(self.GetElementById("txtLastName"), "Schwarzenegger")
        self.SendKeysToElement(self.GetElementById("txtMobileNo"), "56675675")
        self.SendKeysToElement(self.GetElementById("txtEmail"), "ArnyIsCool@Schwarzenegger.com")
        self.SendKeysToElement(self.GetElementById("txtAddress"), "50 apple cross ave")
        self.SendKeysToElement(self.GetElementById("txtPostcode"), "6023")
        self.SendKeysToElement(self.GetElementById("txtSkills"), "BodyBuilder")
        self.Browser.find_element_by_xpath("//input[@id='btnSave']").click()
        alert = self.Browser.switch_to_alert()
        alert.accept()
        self.Browser.find_element_by_xpath("//option[@value='Feb']").click()
        self.SendKeysToElement(self.GetElementById("txtSkills"), "BodyBuilder")
        self.Browser.find_element_by_xpath("//input[@id='chkTue']").click()
        self.Browser.find_element_by_xpath("//input[@id='btnAddAvailability']").click()
        alert = self.Browser.switch_to_alert()
        alert.accept()
        print("Testing Vets Details Finish")
        self.Sleep(3)

    def Appointments(self):
        print("Testing Appointments Start")
        self.SwitchToPage(self.APPOINTMENTS)
        print("Testing Appointments Finish")
        self.Sleep(3)

    def AppointmentsDetails(self):
        print("Testing Appointments Details Start")
        self.SwitchToPage(self.APPOINTMENT_DETAILS)
        self.SendKeysToElement(self.GetElementById("txtAppointmentDate"), "02/01/2023")
        self.Browser.find_element_by_xpath("//select[@id='DropDownListHour']").click()
        self.Browser.find_element_by_xpath("//option[@value='07']").click()
        self.Browser.find_element_by_xpath("//select[@id='DropDownListMinute']").click()
        self.Browser.find_element_by_xpath("//option[@value='45']").click()
        self.SendKeysToElement(self.GetElementById("txtPaid"), "Cakes")
        self.Browser.find_element_by_xpath("//input[@id='chkPaid']").click()
        self.SendKeysToElement(self.GetElementById("txtComments"), "Cakes are tasty and good yis")
        self.Browser.find_element_by_xpath("//div//div//div//table[@id='GridViewPets']//tbody//tr[2]//td[1]//input[1]").click()
        self.Browser.find_element_by_xpath("//div//div//div//table[@id='GridViewVets']//tbody//tr[2]//td[1]//input[1]").click()
        self.Browser.find_element_by_xpath("//input[@id='btnSave']").click()
        alert = self.Browser.switch_to_alert()
        alert.accept()
        self.Browser.find_element_by_xpath("//div[@id='Panel1']//div//div//tbody//tr[4]//td[1]//input[1]").click()
        self.Browser.find_element_by_xpath("//input[@id='txtQuantity']").click()
        self.SendKeysToElement(self.GetElementById("txtQuantity"), "2")
        self.Browser.find_element_by_xpath("//input[@id='btnAddMedication']").click()
        self.Browser.find_element_by_xpath("//input[@id='btnSave']").click()
        alert = self.Browser.switch_to_alert()
        alert.accept()

        self.SendKeysToElement(self.GetElementById("txtSearchPet"), "Arnold")
        self.Browser.find_element_by_xpath("//input[@id='btnSearchPet']").click()

        self.SendKeysToElement(self.GetElementById("txtSearchVet"), "Arnold")
        self.Browser.find_element_by_xpath("//input[@id='btnSearchVet']").click()

        self.SendKeysToElement(self.GetElementById("txtSearchInventory"), "Arnold")
        self.Browser.find_element_by_xpath("//input[@id='btnSearchInventory']").click()
        print("Testing Appointments Details Finish")
        self.Sleep(3)

    def RunCommands(self):
        self.PetOwners()

        self.PetOwnersDetails()

        self.Inventory()

        self.Vets()

        self.VetsDetails()

        self.Appointments()

        self.AppointmentsDetails()

        self.Appointments()

        print("---------------------------")
        print("--  All Tests Complete   --")
        print("---------------------------")

pgs = PageGetSet()