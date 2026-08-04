void setup()
{
  pinMode(2, OUTPUT);
  pinMode(1, OUTPUT);
  pinMode(6, OUTPUT);
  // Através do pino 
}

void loop()
{
  delay(500);
  digitalWrite(2, HIGH);
  digitalWrite(6, HIGH);
  delay(500);
  digitalWrite(6, LOW);
  digitalWrite(2, LOW);
  digitalWrite(4, HIGH);
  delay(500);
  digitalWrite(4, LOW);
}