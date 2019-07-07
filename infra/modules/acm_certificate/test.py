import terraform_validate
import unittest
import os

class TestAcmCertificate(unittest.TestCase):

    def setUp(self):
        # Tell the module where to find your terraform configuration folder
        self.path = os.path.join(os.path.dirname(os.path.realpath(__file__)),"./")
        self.v = terraform_validate.Validator(self.path)

    def test_acm_validation_method(self):
        self.v.error_if_property_missing()
        self.v.resources('aws_acm_certificate').property('validation_method').should_equal('DNS')

if __name__ == '__main__':
    suite = unittest.TestLoader().loadTestsFromTestCase(TestAcmCertificate)
    unittest.TextTestRunner(verbosity=0).run(suite)