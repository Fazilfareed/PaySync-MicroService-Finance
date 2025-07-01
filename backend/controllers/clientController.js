const Client = require('../models/Client');

// Create a new client registration
exports.registerClient = async (req, res) => {
  try {
    const clientData = req.body;

    const existingClient = await Client.findOne({ registrationId: clientData.registrationId });
    if (existingClient) {
      return res.status(400).json({ message: 'Client with this Registration ID already exists' });
    }

    const newClient = new Client(clientData);
    await newClient.save();

    res.status(201).json({ message: 'Client registered successfully', client: newClient });
  } catch (error) {
    res.status(500).json({ message: 'Error registering client', error: error.message });
  }
};

// Get all clients (with optional filters: status, reviewer)
exports.getAllClients = async (req, res) => {
  try {
    const { status, reviewer } = req.query;

    const filter = {};
    if (status) filter.status = status;
    if (reviewer) filter.assignedReviewer = reviewer;

    const clients = await Client.find(filter).populate('assignedReviewer', 'name email');

    res.status(200).json(clients);
  } catch (error) {
    res.status(500).json({ message: 'Error fetching clients', error: error.message });
  }
};

// Get a specific client by ID
exports.getClientById = async (req, res) => {
  try {
    const client = await Client.findById(req.params.id).populate('assignedReviewer', 'name email');

    if (!client) {
      return res.status(404).json({ message: 'Client not found' });
    }

    res.status(200).json(client);
  } catch (error) {
    res.status(500).json({ message: 'Error retrieving client', error: error.message });
  }
};

// Update client status (approve/reject)
exports.updateClientStatus = async (req, res) => {
  try {
    const { status, agentNotes } = req.body;

    const updateFields = {
      status,
      agentNotes,
      lastUpdated: new Date(),
    };

    if (status === 'Approved') updateFields.approvedAt = new Date();
    if (status === 'Rejected') updateFields.rejectedAt = new Date();

    const client = await Client.findByIdAndUpdate(req.params.id, updateFields, { new: true });

    if (!client) {
      return res.status(404).json({ message: 'Client not found' });
    }

    res.status(200).json({ message: 'Client status updated', client });
  } catch (error) {
    res.status(500).json({ message: 'Error updating client', error: error.message });
  }
};
