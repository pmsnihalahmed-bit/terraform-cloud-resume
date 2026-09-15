const API_URL = "https://1xw68dddu3.execute-api.ap-south-2.amazonaws.com/count";

async function updateVisitorCount() {
    const counterElement = document.getElementById("visitor-count");

    try {
        const response = await fetch(API_URL);

        if (!response.ok) {
            throw new Error(`HTTP error: ${response.status}`);
        }

        const data = await response.json();

        counterElement.textContent = data.count;
    } catch (error) {
        console.error("Failed to fetch visitor count:", error);
        counterElement.textContent = "Unavailable";
    }
}

updateVisitorCount();
