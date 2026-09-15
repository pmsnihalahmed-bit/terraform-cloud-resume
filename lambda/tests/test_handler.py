import json
from unittest.mock import MagicMock, patch

import handler


@patch("handler.table")
def test_lambda_handler_returns_incremented_count(mock_table):
    mock_table.update_item.return_value = {
        "Attributes": {
            "visit_count": 6
        }
    }

    response = handler.lambda_handler({}, {})

    assert response["statusCode"] == 200

    body = json.loads(response["body"])

    assert body["count"] == 6

    mock_table.update_item.assert_called_once_with(
        Key={
            "id": "visitors"
        },
        UpdateExpression="ADD visit_count :increment",
        ExpressionAttributeValues={
            ":increment": 1
        },
        ReturnValues="UPDATED_NEW"
    )
