class Campaign < ApplicationRecord

  belongs_to :user
  has_many   :members, dependent: :destroy

  enum status: [ :pending, :finished ]

  before_validation :set_status, on: :create
  after_validation  :set_member, on: :create

  validates :title, :description, :user, :status, presence: true

  def count_opened
    self.members.where(open: true).count
  end

  private

  def set_status
    self.status = :pending
  end

  def set_member
    self.members << Member.create(name: self.user.name, email: self.user.email)
  end

end
