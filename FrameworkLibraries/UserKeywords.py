import os

def create_folder():
    os.mkdir("C:\\TestingWorldIndia")

def create_subfolder():
    os.mkdir("C:\\TestingWorldIndia\\India")


def create_folder_name(foldername):
    os.mkdir("C:\\"+foldername)


def create_subfolder_name(subfoldername):
    os.mkdir("C:\\TestingWorldIndia\\"+subfoldername)

def concatinate_two_values(val1, val2):
    val3=val1+" "+val2
    return val3