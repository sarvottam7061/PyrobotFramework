from robot.libraries.BuiltIn import BuiltIn

test_case_name = BuiltIn().get_variable_value("${TEST_NAME}")
suite_py_name = BuiltIn().get_variable_value("${SUITE_NAME}")