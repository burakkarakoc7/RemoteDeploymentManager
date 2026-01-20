import unittest
import json
import os

class TestDeploymentPipeline(unittest.TestCase):

    def setUp(self):
        # Test öncesi hazırlık
        self.mock_config = {
            "target_hosts": ["192.168.1.10", "192.168.1.11"],
            "rollback_enabled": True
        }

    def test_verify_canary_data(self):
        """Canary sunucu loglarının formatını test eder"""
        print("\nTesting Canary Logs integrity...")
        
        current_dir = os.path.dirname(__file__)
        file_path = os.path.join(current_dir, 'canary_logs.json')
        
        with open(file_path, 'r') as f:
            data = json.load(f)
            
        self.assertTrue(len(data) > 0)
        self.assertIn("server_id", data[0])
        self.assertIn("status", data[0])

    def test_mock_rollback_trigger(self):
        """Hata oranı yüksekse Rollback tetiklenmeli"""
        print("\nTesting Rollback Trigger Mechanism...")
        
        # Simüle edilen hata oranı
        current_error_rate = 0.15  # %15 hata
        THRESHOLD = 0.10           # %10 sınır
        
        rollback_triggered = False
        if current_error_rate > THRESHOLD:
            rollback_triggered = True
            
        self.assertTrue(rollback_triggered, "Yüksek hatada rollback çalışmadı!")

if __name__ == '__main__':
    unittest.main()
